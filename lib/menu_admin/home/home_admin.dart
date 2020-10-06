import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:happy_sales/login.dart';
import 'package:happy_sales/tes.dart';
import 'package:happy_sales/api/user.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../monitor/monitor_admin.dart';

class HomeAdminPage extends StatefulWidget {
  @override
  _HomeAdminPageState createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {

  static var aalc = AreaAndLineChart.withSample();
  static var aabc = SimpleBarChart.withSampleData();
  String kode = "";
  String username = "";
  String name = "";
  String email = "";
  String foto = "";

  @override
  void initState() {
    super.initState();
    User.getKode().then((user) {
      kode = user;
      setState(() {});
    });
    User.getUser().then((user) {
      username = user;
      setState(() {});
    });
    User.getName().then((user) {
      name = user;
      setState(() {});
    });
    User.getEmail().then((user) {
      email = user;
      setState(() {});
    });
    User.getFoto().then((user) {
      foto = user;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Sales Happy, Everybody Happy"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(username),
              accountEmail: new Text(email),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: AssetImage(foto),
              ),
            ),
            new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
              onTap: () => Navigator.of(context).pop(),
            ),
            new ListTile(
                title: new Text("Monitor Lokasi"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new MonitorAdminPage(kode)));
                }),
            new ListTile(
                title: new Text("Konfirmasi Kunjungan"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new TesPage("Konfirmasi Kunjungan")));
                }),
            new ListTile(
                title: new Text("Laporan Kunjungan"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new TesPage("Laporan Kunjungan")));
                }),
            new ListTile(
                title: new Text("Kinerja"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new TesPage("Kinerja")));
                }),
            new Divider(),
            new ListTile(
                title: new Text("Profile"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new TesPage("Profile")));
                }),
            new ListTile(
                title: new Text("Logout"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Logout.logout(username).then((value) {
                    setState(() {});
                  });
                  User.prefClear();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) {
                      return LoginPage();
                    }),
                  );
                }),
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 10.0, left: 10.0),
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    child: Text("Grafik Penjualan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.red))),
                // Container(
                //     child: Text("Lihat Detail",
                //         style: TextStyle(
                //             fontSize: 14,
                //             color: Colors.black))),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 250.0,
              child: aalc,
            ),
            Divider(
              height: 15.0,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Text("Grafik Kinerja",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red)),
                // Text("Lihat Detail",
                //     style: TextStyle(fontSize: 14, color: Colors.black)),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 250.0,
              child: aabc,
            ),
          ])),
    );
  }
}

/// Line chart example
class AreaAndLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  AreaAndLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory AreaAndLineChart.withSample() {
    return new AreaAndLineChart(
      _createSample(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        animate: animate,
        customSeriesRenderers: [
          new charts.LineRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customArea',
              includeArea: true,
              stacked: true),
        ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Sales, int>> _createSample() {
    final myFakeDesktopData = [
      new Sales(0, 5),
      new Sales(1, 25),
      new Sales(2, 100),
      new Sales(3, 75),
      new Sales(4, 150),
    ];

    return [
      new charts.Series<Sales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: myFakeDesktopData,
      )
        // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customArea'),
    ];
  }
}

/// Sample linear data type.
class Sales {
  final int year;
  final int sales;

  Sales(this.year, this.sales);
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
