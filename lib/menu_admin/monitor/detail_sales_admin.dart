import 'package:flutter/material.dart';
import 'package:happy_sales/menu_admin/monitor/map_individu_admin.dart' as map;
import 'package:happy_sales/menu_admin/monitor/log_individu_admin.dart' as log;

class DetailSalesAdminPage extends StatefulWidget {
  final String id;
  final String name;
  DetailSalesAdminPage(this.id, this.name);

  @override
  _DetailSalesAdminPageState createState() =>
      _DetailSalesAdminPageState(id, name);
}

class _DetailSalesAdminPageState extends State<DetailSalesAdminPage> {
  final String id;
  final String name;
  _DetailSalesAdminPageState(this.id, this.name);

  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      new map.MapIndividuAdminPage(id),
      new log.LogIndividuAdminPage(id),
    ];

    final _buttomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("Map")),
      BottomNavigationBarItem(icon: Icon(Icons.person_pin), title: Text("Log"))
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _buttomNavBarItems,
      currentIndex: _selectedTabIndex,
      backgroundColor: Colors.red,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
