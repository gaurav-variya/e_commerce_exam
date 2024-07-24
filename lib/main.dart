
import 'package:flutter/material.dart';
import 'package:ecommerce_exam/views/Home_Page.dart';
import 'package:ecommerce_exam/views/Cart_Page.dart';
import 'package:ecommerce_exam/views/Detail_page.dart';

void main() {
  runApp(
    const Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      routes: {
        'home_page': (context) => const Homepage(),
        'detail_page': (context) => const DetailPage(),
        'CartPage': (context) => CartPage(),
      },
    );
  }
}
