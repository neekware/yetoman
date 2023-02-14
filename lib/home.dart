import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2 Drawers"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(_isDrawerOpen ? Icons.close : Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                setState(() {
                  _isDrawerOpen = !_isDrawerOpen;
                });
              },
            );
          },
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors.transparent,
        ),
        child: Container(
          width: 300,
          color: Colors.white,
          margin: EdgeInsets.only(top: AppBar().preferredSize.height),
          child: const Center(
            child: Text(
              "Settings",
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: const Center(
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
