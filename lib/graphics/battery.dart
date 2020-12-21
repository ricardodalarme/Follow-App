import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;

class BatteryGraphic extends StatelessWidget {
  final adjustData = [
    {"type": "Email", "index": 0, "value": 120},
    {"type": "Email", "index": 1, "value": 132},
    {"type": "Email", "index": 2, "value": 101},
    {"type": "Email", "index": 3, "value": 134},
    {"type": "Email", "index": 4, "value": 90},
    {"type": "Email", "index": 5, "value": 230},
    {"type": "Email", "index": 6, "value": 210},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 300,
      child: graphic.Chart(
        data: adjustData,
        scales: {
          'index': graphic.CatScale(
            accessor: (map) => map['index'].toString(),
            range: [0, 1],
          ),
          'type': graphic.CatScale(
            accessor: (map) => map['type'] as String,
          ),
          'value': graphic.LinearScale(
            accessor: (map) => map['value'] as num,
            nice: true,
          ),
        },
        geoms: [
          graphic.LineGeom(
            position: graphic.PositionAttr(field: 'index*value'),
            color: graphic.ColorAttr(field: 'type'),
            shape: graphic.ShapeAttr(
                values: [graphic.BasicLineShape(smooth: true)]),
          )
        ],
        axes: {
          'index': graphic.Defaults.horizontalAxis,
          'value': graphic.Defaults.verticalAxis,
        },
      ),
    );
  }
}
