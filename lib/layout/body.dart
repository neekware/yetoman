import 'package:flutter/material.dart';

import '../platform/query.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
