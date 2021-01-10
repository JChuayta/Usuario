import 'package:flutter/material.dart';
import 'package:focus_app/src/pages/home_page.dart';
import 'package:focus_app/src/pages/login_page.dart';
import 'package:focus_app/src/pages/pago_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return TfliteHome();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOCUS',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'pago': (BuildContext context) => EfectuarPago(),
      },
      theme: ThemeData(primaryColor: Colors.grey[200]),
    );
  }
}
