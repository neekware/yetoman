import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yetoman/config/environment.dart';
import 'package:yetoman/model/state.dart';

class LayoutStateNotifier extends StateNotifier<LayoutState> {
  LayoutStateNotifier() : super(LayoutState(appName: appName));

  getState() {
    return state;
  }

  LayoutState setMenu(bool menuOpen) {
    state = state.clone(menuOpen: menuOpen);
    return state;
  }

  LayoutState toggleMenu() {
    bool closeNotify = !state.menuOpen && state.notifyOpen && state.isHandset;
    state = state.clone(
      menuOpen: !state.menuOpen,
      notifyOpen: closeNotify ? false : state.notifyOpen,
    );
    return state;
  }

  LayoutState setNotify(bool notifyOpen) {
    state = state.clone(notifyOpen: notifyOpen);
    return state;
  }

  LayoutState toggleNotify() {
    bool closeMenu = !state.notifyOpen && state.menuOpen && state.isHandset;
    state = state.clone(
      notifyOpen: !state.notifyOpen,
      menuOpen: closeMenu ? false : state.menuOpen,
    );
    return state;
  }
}

final layoutStateProvider =
    StateNotifierProvider<LayoutStateNotifier, LayoutState>((ref) {
  return LayoutStateNotifier();
});
