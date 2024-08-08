import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("Payment Succssfull"),
        backgroundColor: Color.fromARGB(255, 67, 16, 12),
      ),
      body: Center(
        child: Text("Transaction Made !"),
      ),
    );
  }
}
