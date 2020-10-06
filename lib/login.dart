import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happy_sales/menu_admin/home/home_admin.dart';
import 'package:happy_sales/menu_sales/home/home_sales.dart';
import 'package:happy_sales/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController i_username = TextEditingController();
  TextEditingController i_password = TextEditingController();
  User user;

  getAkses() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("akses") ?? "null";
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/logo.jpg'),
      ),
    );

    final username = TextField(
      controller: i_username,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextField(
      controller: i_password,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(32.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          User.connectToAPI(i_username.text, i_password.text).then((value) {
            var akses;
            getAkses().then((value) {
              akses = value;
            });
            user = value;
            if (value != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) {
                  if (int.parse(akses) == 1) {
                    return HomeSalesPage();
                  } else {
                    return HomeAdminPage();
                  }
                }),
              );
            } else {
              Fluttertoast.showToast(
                  msg: "Username Atau Password Salah!!!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          });
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        "Lupa Password ?",
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 50.0),
            username,
            SizedBox(height: 15.0),
            password,
            SizedBox(height: 24.0),
            loginButon,
            forgotLabel,
          ],
        ),
      ),
    );
  }
}
