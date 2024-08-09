import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/pages/homepage.dart';

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
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 67, 16, 12),
                    size: 100,
                  ),
                ),
                Text(
                  "Succssfull",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 22),
                  child: Text(
                    '-' + '\$' + value.calculateItemPrice(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    print(value.clearCart());
                    return HomePage();
                  })),
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 14, 26, 159),
                        borderRadius: BorderRadius.circular(13),
                        border: Border(top: BorderSide.none)),
                    child: Text(
                      "Finshed",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
