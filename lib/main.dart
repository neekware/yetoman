import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent, // Parent container is transparent
            child: const Center(
              child: Text(
                'Hello, World!',
                style: TextStyle(
                    fontSize: 24, color: Colors.blue), // Child text is opaque
              ),
            ),
          ),
        ),
      ),
    );
  }
}
