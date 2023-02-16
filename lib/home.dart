import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yetoman/screens/about.dart';

import 'layout/scaffold.dart';

class HomePage extends ConsumerWidget {
  static String namedRoute = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutScaffold(
      child: Center(
          child: GestureDetector(
              child: const Text(
                "Content",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              onTap: () {
                // name route
                Navigator.pushNamed(context, AboutPage.namedRoute);
              })),
    );
  }
}
