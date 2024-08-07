import 'package:flutter/material.dart';
import 'package:shopping_app/pages/homepage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 176, 135, 241),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 24, right: 24, top: 100, bottom: 10),
            child: Image.asset('lib/images/header.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Shopping App",
              style: TextStyle(
                  fontFamily: 'OutFit',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 4, 39, 69)),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "Start Small !!!",
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage();
            })),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(12)),
                width: 200,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
