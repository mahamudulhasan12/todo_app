import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text("Setting page"),
        centerTitle: true,
      ),
      body:Center(child: Text("Sucessfull")) ,
    );
  }
}