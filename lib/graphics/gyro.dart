import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;

class GyroGraphic extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final lineData = [
    {"Date": "04.01.2016", "Close": 126.12},
    {"Date": "05.01.2016", "Close": 125.688},
    {"Date": "06.01.2016", "Close": 119.704},
    {"Date": "07.01.2016", "Close": 120.19},
    {"Date": "08.01.2016", "Close": 121.157},
    {"Date": "11.01.2016", "Close": 117},
    {"Date": "12.01.2016", "Close": 111.487},
    {"Date": "13.01.2016", "Close": 122},
    {"Date": "14.01.2016", "Close": 117.76},
    {"Date": "15.01.2016", "Close": 114.397},
    {"Date": "18.01.2016", "Close": 116.373},
    {"Date": "19.01.2016", "Close": 120.547},
    {"Date": "20.01.2016", "Close": 113.733},
    {"Date": "21.01.2016", "Close": 114.098},
    {"Date": "22.01.2016", "Close": 123.833},
    {"Date": "25.01.2016", "Close": 125},
    {"Date": "26.01.2016", "Close": 124.866},
    {"Date": "27.01.2016", "Close": 120.264},
    {"Date": "28.01.2016", "Close": 122.296},
    {"Date": "29.01.2016", "Close": 124.502},
    {"Date": "01.02.2016", "Close": 127.936},
    {"Date": "02.02.2016", "Close": 132.513},
    {"Date": "03.02.2016", "Close": 129.95},
    {"Date": "04.02.2016", "Close": 129.275},
    {"Date": "05.02.2016", "Close": 127.898},
    {"Date": "08.02.2016", "Close": 134.9},
    {"Date": "09.02.2016", "Close": 122.819},
    {"Date": "10.02.2016", "Close": 120.108},
    {"Date": "11.02.2016", "Close": 119.447},
    {"Date": "12.02.2016", "Close": 117.8},
    {"Date": "15.02.2016", "Close": 122.8},
    {"Date": "16.02.2016", "Close": 121.865},
    {"Date": "17.02.2016", "Close": 126.3},
    {"Date": "18.02.2016", "Close": 128.259},
    {"Date": "19.02.2016", "Close": 125.724}
  ];

  final adjustData = [
    {"type": "Email", "index": 0, "value": 120},
    {"type": "Email", "index": 1, "value": 132},
    {"type": "Email", "index": 2, "value": 101},
    {"type": "Email", "index": 3, "value": 134},
    {"type": "Email", "index": 4, "value": 90},
    {"type": "Email", "index": 5, "value": 230},
    {"type": "Email", "index": 6, "value": 210},
    {"type": "Affiliate", "index": 0, "value": 220},
    {"type": "Affiliate", "index": 1, "value": 182},
    {"type": "Affiliate", "index": 2, "value": 191},
    {"type": "Affiliate", "index": 3, "value": 234},
    {"type": "Affiliate", "index": 4, "value": 290},
    {"type": "Affiliate", "index": 5, "value": 330},
    {"type": "Affiliate", "index": 6, "value": 310},
    {"type": "Video", "index": 0, "value": 150},
    {"type": "Video", "index": 1, "value": 232},
    {"type": "Video", "index": 2, "value": 201},
    {"type": "Video", "index": 3, "value": 154},
    {"type": "Video", "index": 4, "value": 190},
    {"type": "Video", "index": 5, "value": 330},
    {"type": "Video", "index": 6, "value": 410},
    {"type": "Direct", "index": 0, "value": 320},
    {"type": "Direct", "index": 1, "value": 332},
    {"type": "Direct", "index": 2, "value": 301},
    {"type": "Direct", "index": 3, "value": 334},
    {"type": "Direct", "index": 4, "value": 390},
    {"type": "Direct", "index": 5, "value": 330},
    {"type": "Direct", "index": 6, "value": 320},
    {"type": "Search", "index": 0, "value": 320},
    {"type": "Search", "index": 1, "value": 432},
    {"type": "Search", "index": 2, "value": 401},
    {"type": "Search", "index": 3, "value": 434},
    {"type": "Search", "index": 4, "value": 390},
    {"type": "Search", "index": 5, "value": 430},
    {"type": "Search", "index": 6, "value": 420},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            child: Text('Smooth Line and Area', style: TextStyle(fontSize: 20)),
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          ),
          Container(
            width: 350,
            height: 300,
            child: graphic.Chart(
              data: lineData,
              scales: {
                'Date': graphic.CatScale(
                  accessor: (map) => map['Date'] as String,
                  range: [0, 1],
                  tickCount: 5,
                ),
                'Close': graphic.LinearScale(
                  accessor: (map) => map['Close'] as num,
                  nice: true,
                  min: 100,
                )
              },
              geoms: [
                graphic.AreaGeom(
                  position: graphic.PositionAttr(field: 'Date*Close'),
                  shape: graphic.ShapeAttr(
                      values: [graphic.BasicAreaShape(smooth: true)]),
                  color: graphic.ColorAttr(values: [
                    graphic.Defaults.theme.colors.first.withAlpha(80),
                  ]),
                ),
                graphic.LineGeom(
                  position: graphic.PositionAttr(field: 'Date*Close'),
                  shape: graphic.ShapeAttr(
                      values: [graphic.BasicLineShape(smooth: true)]),
                  size: graphic.SizeAttr(values: [0.5]),
                ),
              ],
              axes: {
                'Date': graphic.Defaults.horizontalAxis,
                'Close': graphic.Defaults.verticalAxis,
              },
            ),
          ),
          Padding(
            child:
                Text('Multi Line (No Stack)', style: TextStyle(fontSize: 20)),
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          ),
          Container(
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
          ),
        ],
      ),
    );
  }
}
