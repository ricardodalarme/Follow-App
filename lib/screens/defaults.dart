import 'package:flutter/material.dart';

class DefaultsScreen extends StatefulWidget {
  DefaultsScreen({Key key}) : super(key: key);

  @override
  _DefaultsScreenState createState() => _DefaultsScreenState();
}

class _DefaultsScreenState extends State<DefaultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(),
          ],
        ),
      ),
    );
  }
}
