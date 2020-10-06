import 'package:flutter/material.dart';
import 'package:happy_sales/api/admin/monitor/filter_model.dart';
import 'package:happy_sales/menu_admin/monitor/detail_sales_admin.dart';

class ListSalesAdminPage extends StatefulWidget {
  final String kode;
  ListSalesAdminPage(this.kode);

  @override
  _ListSalesAdminPageState createState() => new _ListSalesAdminPageState(kode);
}

class _ListSalesAdminPageState extends State<ListSalesAdminPage> {
  final String kode;
  _ListSalesAdminPageState(this.kode);

  List data;

  @override
  void initState() {
    FilterSales.getListSales(kode).then((user) {
      data = user;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Daftar Sales"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new FlatButton(
            child: Card(
              elevation: 5.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(data[index].foto),
                ),
                title: Text(data[index].name, style: TextStyle(fontSize: 16)),
                subtitle: Text(data[index].id, style: TextStyle(fontSize: 14)),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new DetailSalesAdminPage(
                      data[index].id, data[index].name)));
            },
          );
        },
      ),
    );
  }
}
