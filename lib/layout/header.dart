import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yetoman/state/layout_state.dart';
import 'package:yetoman/util/animation/util.dart';

import '../model/state.dart';
import '../util/animation/model.dart';
import '../util/animation/rotation.dart';

class LayoutHeader extends ConsumerWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final String title;
  final AppBar appBar;
  final _menuRotationNotifier = rotationNotifier(180);
  final _notifyRotationNotifier = rotationNotifier(180);

  LayoutHeader({Key? key, required this.title, required this.appBar})
      : super(key: key);

  void handleDrawer(BuildContext context, LayoutState state) {
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
          return GestureDetector(
            onTap: () {
              _menuRotationNotifier.value = RotationData.fromDegree(
                  degree: _menuRotationNotifier.value.angle,
                  clockwise: true,
                  turns: _menuRotationNotifier.value.turns);

              print('rotation menu ${_menuRotationNotifier.value}');
              handleDrawer(
                  context, ref.read(layoutStateProvider.notifier).toggleMenu());
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: RotateIcon(
                notifier: _menuRotationNotifier,
                child: Icon(layout.menuOpen ? Icons.close : Icons.menu),
              ),
            ),
          );
        },
      ),
      actions: [
        Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                print('rotation notify ${_menuRotationNotifier.value}');
                handleDrawer(context,
                    ref.read(layoutStateProvider.notifier).toggleNotify());
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: RotateIcon(
                  notifier: _notifyRotationNotifier,
                  child: Icon(layout.menuOpen ? Icons.close : Icons.person),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
