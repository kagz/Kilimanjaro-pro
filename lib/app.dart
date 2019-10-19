import 'package:flutter/material.dart';
import 'package:kilimanjaro_app/screens/order_list.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF212931),
        scaffoldBackgroundColor: Color(0xFF212931),
      ),
      home: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: Text(
            "Kilimanjaro App",
            style: TextStyle(
              fontFamily: 'nicefont',
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
        body: OrderList(),

        //FAB is a property of the `Scaffold` Widget
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          //Widget to display inside Floating Action Button, can be `Text`, `Icon` or any widget.
          onPressed: () {
            //Code to execute when Floating Action Button is clicked
            //...
          },
        ),
      ),
    );
  }
}
