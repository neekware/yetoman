// create a content of my state.dart file

import 'package:flutter/foundation.dart';

enum SidenavMode {
  over,
  side,
  push,
}

@immutable
class LayoutState {
  final String appName;
  final bool isHandset;
  final bool isPortrait;
  final bool isDarkTheme;
  final bool isFullscreen;
  final bool menuOpen;
  final bool notifyOpen;
  final SidenavMode menuMode;
  final SidenavMode notifyMode;
  final String signature;

  LayoutState(
      {this.appName = '',
      this.isHandset = false,
      this.isPortrait = false,
      this.isDarkTheme = false,
      this.isFullscreen = false,
      this.menuOpen = false,
      this.notifyOpen = false,
      this.menuMode = SidenavMode.over,
      this.notifyMode = SidenavMode.over,
      this.signature = ''});

  // create a clone function
  LayoutState clone({
    String? appName,
    bool? isHandset,
    bool? isPortrait,
    bool? isDarkTheme,
    bool? isFullscreen,
    bool? menuOpen,
    bool? notifyOpen,
    SidenavMode? menuMode,
    SidenavMode? notifyMode,
    String? signature,
  }) {
    return LayoutState(
      appName: appName ?? this.appName,
      isHandset: isHandset ?? this.isHandset,
      isPortrait: isPortrait ?? this.isPortrait,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      isFullscreen: isFullscreen ?? this.isFullscreen,
      menuOpen: menuOpen ?? this.menuOpen,
      notifyOpen: notifyOpen ?? this.notifyOpen,
      menuMode: menuMode ?? this.menuMode,
      notifyMode: notifyMode ?? this.notifyMode,
      signature: signature ?? this.signature,
    );
  }
}
