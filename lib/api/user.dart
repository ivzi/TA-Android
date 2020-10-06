import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String kode;
  String username;
  String akses;
  String namaDepan;
  String namaBelakang;
  String email;
  String foto;

  User(
      {this.kode,
      this.username,
      this.akses,
      this.namaDepan,
      this.namaBelakang,
      this.email,
      this.foto});

  factory User.createUser(Map<String, dynamic> object) {
    if (object['hak_akses'] == '1') {
      return User(
        kode: object['kode_sales'],
        username: object['username'],
        akses: object['hak_akses'],
        namaDepan: object['nama_depan'],
        namaBelakang: object['nama_belakang'],
        email: object['email'],
        foto: object['foto'],
      );
    } else {
      return User(
        kode: object['kode_sales'],
        username: object['username'],
        akses: object['hak_akses'],
        namaDepan: object['nama_depan'],
        namaBelakang: object['nama_belakang'],
        email: object['email'],
        foto: object['foto'],
      );
    }
  }

  static Future<User> connectToAPI(String user, String pass) async {
    String apiURL = "http://happysales.digiponic.co.id/api/login/index";
    // String apiURL = "http://192.168.43.59/happy_sales/api/login/index";
    // String apiURL = "https://happysales11.000webhostapp.com/api/login/index";

    // var apiResult = await http.get(apiURL);
    var apiResult =
        await http.post(apiURL, body: {"username": user, "password": pass});
    var jsonObject = json.decode(apiResult.body);

    // get method
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    if (userData != null) {
      if (userData["hak_akses"] == '1') {
        savePref(
            userData["kode_sales"],
            userData["username"],
            userData["hak_akses"],
            userData["nama_depan"],
            userData["nama_belakang"],
            userData["email"],
            userData["foto"]);
      } else {
        savePref(
            userData["kode_sales_admin"],
            userData["username"],
            userData["hak_akses"],
            userData["nama_depan"],
            userData["nama_belakang"],
            userData["email"],
            userData["foto"]);
      }
      return User.createUser(userData);
    } else {
      return null;
    }
  }

  static void savePref(String kode, String username, String akses, String nD,
      String nB, String email, String foto) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("kode", kode);
    preferences.setString("username", username);
    preferences.setString("akses", akses);
    preferences.setString("nama", nD + " " + nB);
    preferences.setString("email", email);
    preferences.setString("foto", foto);
  }

  static Future<String> getKode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("kode");
  }

  static Future<String> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("username");
  }

  static Future<String> getAkses() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("akses") ?? "null";
  }

  static Future<String> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("nama");
  }

  static Future<String> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("email");
  }

  static Future<String> getFoto() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("foto");
  }

  static prefClear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}

class Logout {
  static Future<bool> logout(String username) async {
    String apiURL = "http://happysales.digiponic.co.id/api/login/logout";
    // String apiURL = "http://192.168.43.59/happy_sales/api/login/logout";
    // String apiURL = "https://happysales11.000webhostapp.com/api/monitor/log";

    final apiResult = await http.post(apiURL, body: {"username": username});
    var jsonObject = json.decode(apiResult.body);

    // if (apiResult.statusCode == 200) {
      return true;
    // } else {
    //   return false;
    // }
  }
}
