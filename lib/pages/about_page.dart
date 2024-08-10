import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About US"),
        actions: [
          Image.asset(
            'lib/images/header.png',
            scale: 1,
          ),
        ],
      ),
      body: Container(
        // alignment: Alignment.center,
        child: Column(
          children: [
            Container(
                width: 200,
                margin: EdgeInsets.only(top: 30, bottom: 5),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  size: 100,
                )),
            Text(
              "My Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 25), child: Text("22.0.0.1")),
            ExpansionTile(
              leading: Icon(Icons.handshake),
              backgroundColor: Colors.black12,
              title: Text("User Agreement"),
              children: [
                ListTile(
                  title: Text(
                      "test lldllldd dllddl dldl dd ldldld  dld dl  dd d dl d ddl d dldld d"),
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.system_update_alt),
              backgroundColor: Colors.black12,
              title: Text("Version Update"),
              children: [
                ListTile(
                  title: Text(
                      "test lldllldd dllddl dldl dd ldldld  dld dl  dd d dl d ddl d dldld d"),
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.policy),
              backgroundColor: Colors.black12,
              title: Text("Privacy Policy"),
              children: [
                ListTile(
                  title: Text(
                      "test lldllldd dllddl dldl dd ldldld  dld dl  dd d dl d ddl d dldld d"),
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.feedback),
              backgroundColor: Colors.black12,
              title: Text("User FeedBack"),
              children: [
                ListTile(
                  title: Text(
                      "test lldllldd dllddl dldl dd ldldld  dld dl  dd d dl d ddl d dldld d"),
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.code),
              backgroundColor: Colors.black12,
              title: Text("Other Services"),
              children: [
                ListTile(
                  title: Text(
                      "test lldllldd dllddl dldl dd ldldld  dld dl  dd d dl d ddl d dldld d"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
