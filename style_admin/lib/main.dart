import 'package:flutter/material.dart';
import 'package:style_admin/checkout_view.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'Тапсырыстар',
          style: TextStyle(
            color: Color(0xff333333),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat',
          ),
        ),
        elevation: 1,
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        itemCount: 1,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        itemBuilder: (context, index) {
          return CheckoutView();
        },
      ),
    );
  }
}
