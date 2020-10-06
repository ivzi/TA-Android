import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSalesPage extends StatefulWidget {
  @override
  _MapSalesPageState createState() => _MapSalesPageState();
}

class _MapSalesPageState extends State<MapSalesPage> {
  final Set<Marker> _markers = {};
  LatLng _currentPosition = LatLng(-8.161338, 112.605356);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("-8.161338, 112.605356"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId("-8.171338, 112.605356"),
        position: LatLng(-8.171338, 112.605356),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId("-8.181338, 112.605356"),
        position: LatLng(-8.181338, 112.605356),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId("-8.191338, 112.605356"),
        position: LatLng(-8.191338, 112.605356),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Map"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 15.0,
        ),
        markers: _markers,
        // onTap: (position) {
        //   setState(() {
        //     _markers.add(
        //       Marker(
        //         markerId: MarkerId("${position.latitude}, ${position.longitude}"),
        //         position: position,
        //         icon: BitmapDescriptor.defaultMarker,
        //       ),
        //     );
        //   });
        // },
      ),
    );
  }
}
