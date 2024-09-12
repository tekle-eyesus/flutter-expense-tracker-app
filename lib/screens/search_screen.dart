import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("data"),
          actions: [
            Container(
              color: Colors.red,
              width: 100,
              child: TextField(
                cursorWidth: 10,
                decoration: InputDecoration(
                    hintText: "Search...", border: InputBorder.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}
