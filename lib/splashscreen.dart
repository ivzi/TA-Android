import 'package:flutter/material.dart';
import 'package:happy_sales/login.dart';
import 'package:happy_sales/menu_admin/home/home_admin.dart';
import 'package:happy_sales/api/user.dart';
import 'package:happy_sales/menu_sales/home/home_sales.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var login;
    User.getUser().then((onValue) {
      login = onValue;
    });
    var akses;
    User.getAkses().then((value) {
      akses = value;
    });
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          if (login == null) {
            return LoginPage();
          } else {
            if (int.parse(akses) == 1) {
              return HomeSalesPage();
            } else {
              return HomeAdminPage();
            }
          }
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/logo.jpg",
          width: 200.0,
          height: 100.0,
        ),
      ),
    );
  }
}
