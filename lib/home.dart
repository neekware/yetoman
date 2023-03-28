import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Hello World',
            style: TextStyle(
              fontSize: 30,
              color: Colors.red.withOpacity(1.0),
              fontWeight: FontWeight.bold,
            )));
  }
}
// class HomePage extends ConsumerWidget {
//   static String namedRoute = '/home';

//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return LayoutScaffold(
//       child: Center(
//           child: GestureDetector(
//               child: const Text(
//                 "Content",
//                 style: TextStyle(color: Colors.black, fontSize: 30),
//               ),
//               onTap: () {
//                 // name route
//                 Navigator.push(
//                   context,
//                   PageRouteBuilder(
//                     pageBuilder: (_, __, ___) => const AboutPage(),
//                     transitionDuration: const Duration(seconds: 0),
//                   ),
//                 );
//               })),
//     );
//   }
// }
