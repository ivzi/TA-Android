import 'dart:async';
import 'package:flutter/material.dart';
import 'package:happy_sales/api/admin/monitor/log_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapIndividuAdminPage extends StatefulWidget {
  final String id;

  MapIndividuAdminPage(this.id);

  @override
  _MapIndividuAdminPageState createState() => _MapIndividuAdminPageState(id);
}

class _MapIndividuAdminPageState extends State<MapIndividuAdminPage> {
  final String id;
  _MapIndividuAdminPageState(this.id);

  final Set<Marker> _markers = {};
  double latitude;
  double longitude;
  List data;
  Timer timer;
  
  LatLng _currentPosition = LatLng(-8.161338, 112.606565);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) => updateM());
  }

  updateM() {
    DateTime now = new DateTime.now();
    DateTime tgl = new DateTime(now.year, now.month, now.day);
    Log.getLog(id, tgl.toString()).then((user) {
      data = user;
      for (var i = 0; i < data.length; i++) {
        latitude = double.parse(data[i].lat);
        longitude = double.parse(data[i].long);
        _markers.add(
          Marker(
            markerId: MarkerId(data[i].lat + ", " + data[i].long),
            position: LatLng(latitude, longitude),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 15.0,
        ),
        markers: _markers,
      ),
    );
  }
}
