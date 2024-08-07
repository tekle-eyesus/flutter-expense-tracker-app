// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/intro_page.dart';
import './models/cart_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
