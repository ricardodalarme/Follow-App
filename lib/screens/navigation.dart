import 'package:flutter/material.dart';
import 'package:follow_app/screens/defaults.dart';
import 'package:follow_app/screens/map.dart';
import 'package:follow_app/screens/telemetry.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({Key key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Telas que vão ser mostradas na barrra de navegação
  static final DefaultsScreen _defaults = new DefaultsScreen();
  static final MapScreen _map = new MapScreen();
  static final TelemetryScreen _telemetry = new TelemetryScreen();

  final List<Widget> _screens = [
    _map,
    _defaults,
    _telemetry,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: _screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: <Widget>[
          Icon(
            Icons.map,
            size: 25,
            color: Colors.black38,
          ),
          Icon(
            Icons.home,
            size: 25,
            color: Colors.black38,
          ),
          Icon(
            Icons.signal_cellular_4_bar_rounded,
            size: 25,
            color: Colors.black38,
          ),
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _selectedIndex == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: value,
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }
}
