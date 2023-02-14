import 'dart:io';

import 'package:flutter/material.dart';

/// Returns true if the device is a mobile device
bool isMobile = Platform.isAndroid || Platform.isIOS;

/// Returns true if the device is an Android device
bool isAndroid = Platform.isAndroid;

/// Returns true if the device is an iOS device
bool isIOS = Platform.isIOS;

/// Returns true if the device is a desktop
bool isDesktop = Platform.isWindows || Platform.isMacOS || Platform.isLinux;

/// Returns true if the device is a web browser
/// @return bool
bool isWeb = !Platform.isWindows &&
    !Platform.isMacOS &&
    !Platform.isLinux &&
    !Platform.isAndroid &&
    !Platform.isIOS;

/// Returns true if the device is in portrait mode
/// @param ctx - BuildContext
/// @return bool
bool isPortrait(BuildContext ctx) {
  return MediaQuery.of(ctx).orientation == Orientation.portrait;
}

/// Returns true if the device is in landscape mode
/// @param ctx - BuildContext
/// @return bool
bool isLandscape(BuildContext ctx) {
  return !isPortrait(ctx);
}

/// Returns true if the screen is less than 600 pixels wide
/// @param ctx - BuildContext
/// @return bool
bool isMobileSize(BuildContext ctx) {
  return MediaQuery.of(ctx).size.shortestSide < 600;
}

/// Returns true if the screen is less than 900 pixels wide
/// @param ctx - BuildContext
/// @return bool
bool isTabletSize(BuildContext ctx) {
  return MediaQuery.of(ctx).size.shortestSide >= 600;
}

/// Returns true if the screen is less than 1200 pixels wide
/// @param ctx - BuildContext
/// @return bool
bool isDesktopSize(BuildContext ctx) {
  return MediaQuery.of(ctx).size.shortestSide >= 900;
}

/// Returns true if the screen is less than 1200 pixels wide
/// @param ctx - BuildContext
/// @return bool
bool isLargeDesktopSize(BuildContext ctx) {
  return MediaQuery.of(ctx).size.shortestSide >= 1200;
}
