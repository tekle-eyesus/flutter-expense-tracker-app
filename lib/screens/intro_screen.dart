import 'package:expense_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    void alertInfo() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Color.fromARGB(255, 177, 137, 137),
                title: Text("😒😒😒😒😒"),
                content: Text(
                  "Not Available for now!!",
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ));
    }

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 23, 11, 12),
            Color.fromARGB(255, 137, 25, 25)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            Icon(
              Icons.monetization_on_outlined,
              size: 200,
              color: Color.fromARGB(255, 164, 129, 14),
              weight: 20,
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomeScreen();
              })),
              child: Padding(
                padding: const EdgeInsets.only(right: 32, left: 32),
                child: Text(
                  "Start with Demo",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            OutlinedButton(
                onPressed: alertInfo,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.g_mobiledata,
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    Text("SignUP with Google"),
                  ],
                )),
            SizedBox(
              height: 200,
            ),
            Column(
              children: [
                Text(
                  "Devleloped By VeinDev",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Copyright © 2024 Tekleeyesus",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
