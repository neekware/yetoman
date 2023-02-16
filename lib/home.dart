import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yetoman/state/store.dart';

import 'model/state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  void handleMenu(BuildContext context, LayoutState state) {
    state.menuOpen
        ? Scaffold.of(context).openDrawer()
        : Scaffold.of(context).closeDrawer();
    state.notifyOpen
        ? Scaffold.of(context).openEndDrawer()
        : Scaffold.of(context).closeEndDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LayoutState layout = ref.watch(layoutStateProvider);

    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              "Home",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("2 Drawers"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(layout.menuOpen ? Icons.close : Icons.menu),
              onPressed: () {
                handleMenu(context,
                    ref.read(layoutStateProvider.notifier).toggleMenu());
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
                  handleMenu(context,
                      ref.read(layoutStateProvider.notifier).toggleNotify());
                },
              );
            },
          )
        ],
      ),
      drawer: Container(
        width: 320,
        color: Colors.blue[100],
        margin: EdgeInsets.only(top: AppBar().preferredSize.height),
        child: const Center(
          child: Text(
            "Settings",
            style: TextStyle(color: Colors.green, fontSize: 30),
          ),
        ),
      ),
      onDrawerChanged: (isOpened) {
        ref.read(layoutStateProvider.notifier).setMenu(isOpened);
      },
      endDrawer: Container(
        width: 320,
        color: Colors.green[100],
        margin: EdgeInsets.only(top: AppBar().preferredSize.height),
        child: const Center(
          child: Text(
            "Notifications",
            style: TextStyle(color: Colors.green, fontSize: 30),
          ),
        ),
      ),
      onEndDrawerChanged: (isOpened) {
        ref.read(layoutStateProvider.notifier).setNotify(isOpened)
      },
    );
  }
}
