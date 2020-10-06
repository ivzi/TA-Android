import 'dart:convert';
import 'package:http/http.dart' as http;

class Log {
  String id;
  String lat;
  String long;
  String tgl;
  String waktu;

  Log({this.id, this.lat, this.long, this.tgl, this.waktu});

  factory Log.createLog(Map<String, dynamic> object) {
    return Log(
        id: object['nomor'],
        lat: object['latitude'],
        long: object['longitude'],
        tgl: object['tanggal'],
        waktu: object['waktu']);
  }

  static Future<List<Log>> getLog(String kode, String tgl) async {
    String apiURL = "http://happysales.digiponic.co.id/api/monitor/log";
    // String apiURL = "http://192.168.43.59/happy_sales/api/monitor/log";
    // String apiURL = "https://happysales11.000webhostapp.com/api/monitor/log";

    var apiResult =
        await http.post(apiURL, body: {"kode": kode, "tanggal": tgl});
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listLog = (jsonObject as Map<String, dynamic>)['data'];

    List<Log> log = [];
    for (int i = 0; i < listLog.length; i++) log.add(Log.createLog(listLog[i]));

    return log;
  }
}
