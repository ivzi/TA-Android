import 'dart:convert';
import 'package:http/http.dart' as http;

class FilterSales {
  String id;
  String name;
  String foto;
  String lat;
  String long;

  FilterSales({this.id, this.name, this.foto, this.lat, this.long});

  factory FilterSales.createList(Map<String, dynamic> object) {
    return FilterSales(
      id: object['kode_sales'],
      name: object['nama_depan'] + " " + object['nama_belakang'],
      foto: object['foto'],
      lat: object['latitude'],
      long: object['longitude']
    );
  }

  static Future<List<FilterSales>> getListSales(String kode) async {
    String apiURL = "http://happysales.digiponic.co.id/api/monitor/loc";
    // String apiURL = "http://192.168.43.59/happy_sales/api/monitor/loc";
    // String apiURL = "https://happysales11.000webhostapp.com/api/monitor/loc";

    var apiResult = await http.post(apiURL, body: {"kode": kode});
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listLoc = (jsonObject as Map<String, dynamic>)['data'];

    List<FilterSales> loc = [];
    for (int i = 0; i < listLoc.length; i++)
      loc.add(FilterSales.createList(listLoc[i]));

    return loc;
  }
}
