import 'package:flutter/material.dart';

class ActualSalesPage extends StatefulWidget {
  @override
  _ActualSalesPageState createState() => _ActualSalesPageState();
}

class _ActualSalesPageState extends State<ActualSalesPage> {
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
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                    color: Colors.yellow,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
            pending,
            pending,
            done,
            done,
          ],
        ),
      ),
    );
  }
}
