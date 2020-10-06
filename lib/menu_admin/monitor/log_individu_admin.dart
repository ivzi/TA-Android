import 'package:flutter/material.dart';
import 'package:happy_sales/api/admin/monitor/log_model.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';
// import 'package:geolocator/geolocator.dart';
// import 'package:happy_sales/api/sales/home/lokasi_model.dart';

class LogIndividuAdminPage extends StatefulWidget {
  final String id;
  LogIndividuAdminPage(this.id);

  @override
  _LogIndividuAdminPageState createState() => _LogIndividuAdminPageState(id);
}

class _LogIndividuAdminPageState extends State<LogIndividuAdminPage> {
  final String id;
  _LogIndividuAdminPageState(this.id);

  String _currentAddress = "";
  List alamat;
  List data;
  Timer timer;

  @override
  void initState() {
    super.initState();
    setState(() {
      updateList();
    });
    // timer = Timer.periodic(Duration(seconds: 3), (Timer t) => updateList());
  }

  updateList() async {
    data = null;
    DateTime now = new DateTime.now();
    DateTime tgl = new DateTime(now.year, now.month, now.day);
    Log.getLog(id, tgl.toString()).then((user) {
      data = user;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: data == null ? 0 : data.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
          );
        },
        itemBuilder: (context, index) {
          getAddressFromLatLng(
                  double.parse(data[index].lat), double.parse(data[index].long))
              .then((value) {
            data[index].id = value;
            setState(() {});
          });
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(data[index].id, style: TextStyle(fontSize: 14)),
                    Text(data[index].waktu, style: TextStyle(fontSize: 10)),
                  ]));
        },
      ),
    );
  }

  getAddressFromLatLng(double la, double lo) async {
    // Position position = await Geolocator()
    //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(la, lo);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    _currentAddress = "${first.addressLine}";
    return _currentAddress;
  }
}
