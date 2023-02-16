// create a content of my main.dart file

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yetoman/config/environment.dart';
import 'package:yetoman/screens/about.dart';

import 'home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialRoute: HomePage.namedRoute,
      routes: {
        HomePage.namedRoute: (context) => const HomePage(),
        AboutPage.namedRoute: (context) => const AboutPage(),
      },
    );
  }
}
