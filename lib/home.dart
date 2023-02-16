import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yetoman/config/environment.dart';
import 'package:yetoman/layout/header.dart';
import 'package:yetoman/platform/query.dart';
import 'package:yetoman/state/layout_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: LayoutHeader(title: appName, appBar: AppBar()),
      body: GestureDetector(
        child: Row(
          children: [
            isDesktopSize(context)
                ? Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blueAccent)),
                    width: 320,
                    child: const Center(
                      child: Text(
                        "Menu",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              child: Container(
                color: Colors.grey[100],
                child: const Center(
                  child: Text(
                    "Content",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
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
        ref.read(layoutStateProvider.notifier).setNotify(isOpened);
      },
    );
  }
}
