import 'package:flutter/material.dart';

class Parabens extends StatelessWidget {
  const Parabens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
        child: const Text(
          "PARABÉNS",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
