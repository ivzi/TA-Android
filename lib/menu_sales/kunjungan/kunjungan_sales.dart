import 'package:flutter/material.dart';
import 'package:happy_sales/menu_sales/kunjungan/plan_sales.dart' as plan;
import 'package:happy_sales/menu_sales/kunjungan/actual_sales.dart' as actual;

class KunjuganSalesPage extends StatefulWidget {
  @override
  _KunjuganSalesPageState createState() => _KunjuganSalesPageState();
}

class _KunjuganSalesPageState extends State<KunjuganSalesPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text("Kunjungan"),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              text: "Plan",
            ),
            new Tab(
              text: "Actual",
            )
          ],
        ),
      ),
      body: new TabBarView(
        //controller untuk tab bar
        controller: controller,
        children: <Widget>[
          //kemudian panggil halaman sesuai tab yang sudah dibuat
          new plan.PlanSalesPage(),
          new actual.ActualSalesPage()
        ],
      ),
    );
  }
}
