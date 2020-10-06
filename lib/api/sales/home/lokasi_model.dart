import 'package:http/http.dart' as http;

class Lokasimodel {
  static Future<bool> updateLokasi(String kode, String tgl, String waktu, String lat, String long) async {
    // String apiURL = "http://192.168.43.59/happy_sales/api/lokasi_sales/log";
    // String apiURL = "https://happysales11.000webhostapp.com/api/lokasi_sales/log";
    String apiURL = "http://happysales.digiponic.co.id/api/lokasi_sales/log";

    final apiResult = await http.post(apiURL, body: {
      "kode": kode,
      "tanggal": tgl,
      "waktu": waktu,
      "latitude": lat,
      "longitude": long
    });
    
    if (apiResult.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateLokasiLive(String kode, String lat, String long) async {
    String apiURL = "http://happysales.digiponic.co.id/api/lokasi_sales/live";
    // String apiURL = "http://192.168.43.59/happy_sales/api/lokasi_sales/live";
    // String apiURL = "https://happysales11.000webhostapp.com/api/lokasi_sales/live";

    final apiResult = await http.post(apiURL, body: {
      "kode": kode,
      "latitude": lat,
      "longitude": long
    });
    
    if (apiResult.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
