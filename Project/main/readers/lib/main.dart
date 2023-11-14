import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text("Readers",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800)),
              elevation: 0.0,
              actions: [
                Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.black),
                Icon(
                    Icons.menu,
                    size: 40,
                    color: Colors.black),
                Icon(
                    Icons.notifications,
                    size: 40,
                    color: Colors.black),
              ]
          ),
          body: Column(
          )
        )
    );
  }
}

