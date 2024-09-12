import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About US"),
      ),
      body: ListView(
          // alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                    width: 200,
                    margin: EdgeInsets.only(top: 30, bottom: 5),
                    child: Icon(
                      Icons.monetization_on,
                      size: 100,
                    )),
                Text(
                  "Expense Tracker",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 25), child: Text("0.2.0")),
                const SizedBox(
                  height: 40,
                ),
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
          ]),
    );
  }
}
