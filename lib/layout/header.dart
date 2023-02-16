import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yetoman/state/layout_state.dart';

import '../model/state.dart';

class LayoutHeader extends ConsumerWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final String title;
  final AppBar appBar;

  const LayoutHeader({Key? key, required this.title, required this.appBar})
      : super(key: key);

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

    return AppBar(
      title: Text(title),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(layout.menuOpen ? Icons.close : Icons.menu),
            onPressed: () {
              handleMenu(
                  context, ref.read(layoutStateProvider.notifier).toggleMenu());
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
