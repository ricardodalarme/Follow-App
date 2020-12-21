import 'package:flutter/material.dart';
import 'package:follow_app/graphics/battery.dart';
import 'package:follow_app/graphics/gyro.dart';
import 'package:follow_app/widgets/measures_list.dart';

class TelemetryScreen extends StatefulWidget {
  TelemetryScreen({Key key}) : super(key: key);

  @override
  _TelemetryScreenState createState() => _TelemetryScreenState();
}

class _TelemetryScreenState extends State<TelemetryScreen> {
  final MeasureList measureList = MeasureList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            measureList,
            Expanded(
              child: currentGraphic(),
            ),
          ],
        ),
      ),
    );
  }

  Widget currentGraphic() {
    switch (measureList.indexOfProvince) {
      case 0:
        return BatteryGraphic();
      case 1:
        return GyroGraphic();
    }
  }
}
