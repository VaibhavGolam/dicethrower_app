import 'package:flutter/material.dart';
import 'package:dicethrower_app/gradient_color.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: GradientColor(
          colors: [
            Color.fromARGB(255, 17, 3, 59),
            Color.fromARGB(255, 25, 8, 8),
          ],
        ),
      ),
    ),
  );
}
