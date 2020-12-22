import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/graphics/battery.dart';
import 'package:follow_app/graphics/gyroscope.dart';

class TelemetryScreen extends StatefulWidget {
  TelemetryScreen({Key key}) : super(key: key);

  @override
  _TelemetryScreenState createState() => _TelemetryScreenState();
}

class _TelemetryScreenState extends State<TelemetryScreen> {
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
  static final BatteryGraphic _battery = new BatteryGraphic();
  static final GyroscopeGraphic _gyroscope = new GyroscopeGraphic();

  final Map<String, Widget> _screens = {
    "Giroscópio": _gyroscope,
    "Encoder": _battery,
    "Sensores": _battery,
    "Motores": _battery,
    "Bateria": _battery,
    "Completo": _battery
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Text(
          "Telemetria",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(
        children: [
          // Lista das métricas
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 10),
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _screens.length,
              itemBuilder: (context, index) => buildCard(index, context),
            ),
          ),
          // Gráficos
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _selectedIndex = index);
                },
                children: _screens.values.toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  Widget buildCard(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _onItemTapped(index);
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _screens.keys.toList()[index],
              style: TextStyle(
                color: index == _selectedIndex
                    ? Colors.black
                    : Colors.black.withOpacity(0.5),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: index == _selectedIndex
                    ? kPrimaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
