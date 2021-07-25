import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 150;
  final String name = "true";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter title"),
      ),
      body: Center(
        child: Container(
          child: Text(" $name : $days "),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
