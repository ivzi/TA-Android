import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSalesPage extends StatefulWidget {
  @override
  _ProfileSalesPageState createState() => _ProfileSalesPageState();
}

class _ProfileSalesPageState extends State<ProfileSalesPage> {
  getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("login") ?? null;
  }
  Choice _selectedChoice = null; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleSection = Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.cyan,
            radius: 40.0,
            child: new Text("I"),
          ),
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/

                Container(
                  padding: const EdgeInsets.only(bottom: 4, left: 26),
                  child: Text(
                    "Muhamad Irfan Zidni",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 26),
                  child: Text(
                    'SLS1007',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    var dpc = DonutPieChart.withSampleData();
    final kinerja = Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 26),
                  child: Text(
                    'Persentase',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 26, top: 2),
                  child: Text(
                    'Kinerja Sales:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 26, top: 22),
                  child: Text('75 %',
                      style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 26, top: 2),
                  child: Text('Baik',
                      style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Container(
            height: 130.0,
            width: 130.0,
            child: dpc,
          ),
        ],
      ),
    );

    final target = Card(
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text('Target'),
            // VerticalDivider(
            //   color: Colors.black45,
            //   thickness: 1,
            //   width: 20,
            //   indent: 200,
            //   endIndent: 200,
            // ),
            new Text('Rp. 1000000',
                style: TextStyle(fontWeight: FontWeight.bold)),
            // VerticalDivider(
            //   color: Colors.black45,
            //   thickness: 1,
            //   width: 20,
            //   indent: 200,
            //   endIndent: 200,
            // ),
            new Text('100 %',
                style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );

    final capaian = Card(
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text('Pencapaian'),
            // VerticalDivider(
            //   color: Colors.black45,
            //   thickness: 2,
            //   width: 20,
            //   indent: 10,
            //   endIndent: 10,
            // ),
            new Text('Rp. 1000000',
                style: TextStyle(fontWeight: FontWeight.bold)),
            // VerticalDivider(
            //   color: Colors.black45,
            //   thickness: 2,
            //   width: 20,
            //   indent: 10,
            //   endIndent: 10,
            // ),
            new Text('100 %',
                style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );

    final kriteria = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            child: new Container(
              padding: new EdgeInsets.all(18.0),
              child: new Column(
                children: <Widget>[
                  new Text('100 %',
                      style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold)),
                  Padding(padding: const EdgeInsets.only(bottom: 8)),
                  new Text('Penjualan',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Card(
            child: new Container(
              padding: new EdgeInsets.all(18.0),
              child: new Column(
                children: <Widget>[
                  new Text('100 %',
                      style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold)),
                  Padding(padding: const EdgeInsets.only(bottom: 8)),
                  new Text('Kunjungan',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Card(
            child: new Container(
              padding: new EdgeInsets.all(18.0),
              child: new Column(
                children: <Widget>[
                  new Text('100 %',
                      style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold)),
                  Padding(padding: const EdgeInsets.only(bottom: 8)),
                  new Text('SOP',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          // overflow menu
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          // shrinkWrap: true,
          padding: EdgeInsets.only(top: 28.0, left: 24.0, right: 24.0),
          children: <Widget>[
            titleSection,
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 130.0,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 20.0),
            kinerja,
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 130.0,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 20.0),
            target,
            SizedBox(height: 8.0),
            capaian,
            SizedBox(height: 8.0),
            kriteria,
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title});

  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Edit Profile'),
  const Choice(title: 'Reset Password'),
];

/// Donut chart example. This is a simple pie chart with a hole in the middle.
class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 15));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 75),
      new LinearSales(1, 25),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
