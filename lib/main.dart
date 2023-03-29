import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Center(
        child: Container(
          color: const Color(0x00000000),
          width: double.infinity,
          height: double.infinity,
          child: const Center(
            child: Text(
              'Hello, World!',
              style: TextStyle(
                  fontSize: 24,
                  color: CupertinoColors.activeBlue), // Child text is opaque
            ),
          ),
        ),
      ),
    );
  }
}
