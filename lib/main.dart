import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CupertinoApp(
      home: Center(
        child: Container(
          color: const Color(0x00000000),
          width: size.width,
          height: size.height,
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
