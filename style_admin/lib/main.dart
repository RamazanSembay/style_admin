import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:style_admin/checkout_view.dart';
import 'package:style_admin/info_view.dart';
import 'package:style_admin/provider/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('Себет').get(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      return Expanded(
                        child: Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data.docs[index];

                              return CheckoutView(
                                name: data['Имя'],
                                street: data['Адрес'],
                                home: data['Дом'],
                                price: data['Сумма товара'],
                                onInfo: () {
                                  // on info
                                  Get.to(InfoView());
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
