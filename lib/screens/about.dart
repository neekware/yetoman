import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home.dart';
import '../layout/scaffold.dart';

class AboutPage extends ConsumerWidget {
  static String namedRoute = '/about';

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutScaffold(
      child: Center(
          child: GestureDetector(
              child: const Text(
                "About Us",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              onTap: () {
                // name route
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const HomePage(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              })),
    );
  }
}
