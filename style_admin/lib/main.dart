import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:style_admin/checkout_view.dart';
import 'package:style_admin/provider/cart_provider.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (context) => (CartProvider()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return HomePage();
            }
          },
        ),
      ),
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
