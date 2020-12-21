import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/widgets/custom_button.dart';
import 'package:follow_app/widgets/custom_text_field.dart';

class ParametersScreen extends StatefulWidget {
  ParametersScreen({Key key}) : super(key: key);

  @override
  _ParametersScreenState createState() => _ParametersScreenState();
}

class _ParametersScreenState extends State<ParametersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: Text(
          "Parâmetros",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.22,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(text: "Proporcional"),
            SizedBox(height: 10),
            CustomTextField(text: "Integral"),
            SizedBox(height: 10),
            CustomTextField(text: "Derivativo"),
            SizedBox(height: 10),
            CustomButton(text: "Confirmar", press: () {}),
          ],
        ),
      ),
    );
  }
}
