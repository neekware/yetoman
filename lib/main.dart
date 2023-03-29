import 'package:flutter/material.dart';
import 'package:macos_window_utils/macos_window_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManipulator.initialize();
  WindowManipulator.makeTitlebarTransparent();
  WindowManipulator.enableFullSizeContentView();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TitlebarSafeArea(
      child: MaterialApp(
        home: Center(
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: Opacity(
              opacity: 0,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0,
                        color: Colors
                            .transparent), //color is transparent so that it does not blend with the actual color specified
                    color: const Color.fromARGB(255, 34, 208, 1)),
                // color: const Color(0x00000000),
                width: 100,
                height: 500,
                child: const Center(
                  child: Text(
                    'Hello, World!',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.blueAccent), // Child text is opaque
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
