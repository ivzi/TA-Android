import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy_sales/api/admin/monitor/filter_model.dart';
import 'list_sales_admin.dart';

class MonitorAdminPage extends StatefulWidget {
  final String kode;
  MonitorAdminPage(this.kode);

  @override
  _MonitorAdminPageState createState() => _MonitorAdminPageState(kode);
}

class _MonitorAdminPageState extends State<MonitorAdminPage> {
  final String kode;
  _MonitorAdminPageState(this.kode);

  final Set<Marker> _markers = {};
  double latitude;
  double longitude;
  List data;
  Timer timer;
  LatLng _currentPosition = LatLng(-8.161338, 112.605356);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) => updateMarker());
  }

  updateMarker() async {
    // setState(() {
    data = null;
    _markers.removeAll(_markers);
    // _markers.clear(_markers);
    FilterSales.getListSales(kode).then((user) {
      data = user;
      for (var i = 0; i < data.length; i++) {
        latitude = double.parse(data[i].lat);
        longitude = double.parse(data[i].long);
        _markers.add(
          Marker(
            markerId: MarkerId(data[i].lat + ", " + data[i].long),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: data[i].lat + ", " + data[i].long),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      }
      setState(() {});
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Monitoring Sales"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 15.0,
        ),
        markers: _markers,
      ),
      floatingActionButton: new FloatingActionButton.extended(
          label: Text("Individu"),
          icon: Icon(Icons.person),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          tooltip: 'Individu',
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new ListSalesAdminPage(kode)));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
