// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../config/environment.dart';
// import '../home.dart';
// import '../state/layout_state.dart';
// import 'body.dart';
// import 'header.dart';

// class LayoutScaffold extends ConsumerWidget {
//   final Widget child;
//   const LayoutScaffold({super.key, required this.child});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: LayoutHeader(title: appName, appBar: AppBar()),
//       body: LayoutBody(child: child),
//       drawer: Container(
//         width: 320,
//         color: Colors.blue[100],
//         margin: EdgeInsets.only(top: AppBar().preferredSize.height),
//         child: GestureDetector(
//           child: const Center(
//             child: Text(
//               "Home",
//               style: TextStyle(color: Colors.green, fontSize: 30),
//             ),
//           ),
//           onTap: () {
//             // name route
//             Navigator.push(
//               context,
//               PageRouteBuilder(
//                 pageBuilder: (_, __, ___) => const HomePage(),
//                 transitionDuration: const Duration(seconds: 0),
//               ),
//             );
//           },
//         ),
//       ),
//       onDrawerChanged: (isOpened) {
//         ref.read(layoutStateProvider.notifier).setMenu(isOpened);
//       },
//       endDrawer: Container(
//         width: 320,
//         color: Colors.green[100],
//         margin: EdgeInsets.only(top: AppBar().preferredSize.height),
//         child: const Center(
//           child: Text(
//             "Notifications",
//             style: TextStyle(color: Colors.green, fontSize: 30),
//           ),
//         ),
//       ),
//       onEndDrawerChanged: (isOpened) {
//         ref.read(layoutStateProvider.notifier).setNotify(isOpened);
//       },
//     );
//   }
// }
