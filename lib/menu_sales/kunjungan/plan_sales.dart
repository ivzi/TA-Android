import 'package:flutter/material.dart';

class PlanSalesPage extends StatefulWidget {
  @override
  _PlanSalesPageState createState() => _PlanSalesPageState();
}

class _PlanSalesPageState extends State<PlanSalesPage> {
  @override
  Widget build(BuildContext context) {
    final done = Card(
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    'Tempat 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  new Text(
                    'Gondanglegi Malang',
                  ),
                  SizedBox(height: 10.0),
                  new Text(
                    '7 Januari 2020',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    'Done',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.red,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 10,
                      padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                      onPressed: () {},
                      child: Text("Kirim",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final pending = Card(
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    'Tempat 2',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  new Text(
                    'Gondanglegi Malang',
                  ),
                  SizedBox(height: 10.0),
                  new Text(
                    '11 Januari 2020',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    'Pending',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.yellow[600],
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                      onPressed: () {},
                      child: Text("Kirim",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final active = Card(
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    'Tempat 3',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  new Text(
                    'Gondanglegi Malang',
                  ),
                  SizedBox(height: 10.0),
                  new Text(
                    '17 Januari 2020',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    'Active',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.green[400],
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                      onPressed: () {},
                      child: Text("Kirim",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: 24.0, left: 20.0, right: 20.0),
          children: <Widget>[
            active,
            pending,
            done,
            done,
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton.extended(
          label: Text("Kunjungan Lain"),
          icon: Icon(Icons.add),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          tooltip: 'Kunjungan Lain',
          onPressed: () {}),
    );
  }
}
