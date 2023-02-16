import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/environment.dart';
import '../state/layout_state.dart';
import 'body.dart';
import 'header.dart';

class LayoutScaffold extends ConsumerWidget {
  const LayoutScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: LayoutHeader(title: appName, appBar: AppBar()),
      body: const LayoutBody(),
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
        ref.read(layoutStateProvider.notifier).setNotify(isOpened);
      },
    );
  }
}
