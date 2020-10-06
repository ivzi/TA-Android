import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:happy_sales/login.dart';
import 'package:happy_sales/menu_sales/map/map_sales.dart';
import 'package:happy_sales/api/sales/home/lokasi_model.dart';
import 'package:happy_sales/menu_sales/kunjungan/kunjungan_sales.dart';
import 'package:happy_sales/tes.dart';
import 'package:happy_sales/menu_sales/profile/profile_sales.dart';
import 'package:happy_sales/api/user.dart';
import 'package:table_calendar/table_calendar.dart';
import '../kunjungan/form_kunjungan_sales.dart';

class HomeSalesPage extends StatefulWidget {
  @override
  _HomeSalesPageState createState() => _HomeSalesPageState();
}

class _HomeSalesPageState extends State<HomeSalesPage> {
  static final List<String> imgSlider = [
    'assets/slider/a.png',
    'assets/slider/b.png'
  ];

  static final CarouselSlider autoPlayImage = CarouselSlider(
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            fileImage,
            width: 10000,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    height: 150,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 2.0,
  );

  static var aalc = AreaAndLineChart.withSample();
  static var dpc = DonutPieChart.withSampleData();
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

  CalendarController _controller;
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
    updateLog();
    updateLive();
    _controller = CalendarController();
  }

  updateLive() async {
    return Timer.periodic(Duration(seconds: 3), (timer) async {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      Lokasimodel.updateLokasiLive(
              kode, position.latitude.toString(), position.longitude.toString())
          .then((value) {
        setState(() {});
      });
    });
  }

  updateLog() async {
    return Timer.periodic(Duration(minutes: 15), (timer) async {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      DateTime now = new DateTime.now();
      DateTime tgl = new DateTime(now.year, now.month, now.day);
      DateTime jam = new DateTime(now.hour, now.minute, now.second);
      print(jam);
      Lokasimodel.updateLokasi(kode, tgl.toString(), jam.toString(), position.latitude.toString(),
              position.longitude.toString())
          .then((value) {
        setState(() {});
      });
    });

    // LocationData myLocation;
    // String error;
    // Location location = new Location();
    // try {
    //   myLocation = await location.getLocation();
    // } on PlatformException catch (e) {
    //   if (e.code == 'PERMISSION_DENIED') {
    //     error = 'please grant permission';
    //     print(error);
    //   }
    //   if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
    //     error = 'permission denied please enable it from app setting';
    //     print(error);
    //   }
    //   myLocation = null;
    // }
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
              accountName: new Text(name),
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
                title: new Text("Order"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new TesPage("Order")));
                }),
            new ListTile(
                title: new Text("Omset"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new TesPage("Omset")));
                }),
            new ListTile(
                title: new Text("Kunjungan"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new KunjuganSalesPage()));
                }),
            new ListTile(
                title: new Text("Map"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new MapSalesPage()));
                }),
            new ListTile(
                title: new Text("Laporan"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new FormKunjungan()));
                }),
            new Divider(),
            new ListTile(
                title: new Text("Profile"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ProfileSalesPage()));
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            autoPlayImage,
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 10.0),
            Text("Penjualan", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 150.0,
              child: aalc,
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 10.0),
            kinerja,
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                color: Colors.black45,
              ),
            ),
            TableCalendar(calendarController: _controller)
          ],
        ),
      ),
    );
  }
}

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
