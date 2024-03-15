import 'package:flutter/material.dart';
import 'package:wisatajogja/detail_screen.dart';
import 'package:wisatajogja/main_screen.dart';
import 'package:wisatajogja/model/tourism_place.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wisata jogja',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hero Animation Sample"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Hero(
//               tag: "logo",
//               child: Image.asset(
//                 "asset/dicoding.png",
//                 width: 150,
//                 height: 150,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AnotherScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Another Screen"),
//       ),
//       body: Center(
//         child: Hero(
//           tag: "logo",
//           child: Image.asset(
//             "asset/dicoding.png",
//             width: 75,
//             height: 75,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DetailScreen extends StatelessWidget {
//   const DetailScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           const Text('Second Screen'),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('Go to First Screen'),
//           ),
//         ],
//         // child: ElevatedButton(
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         //   child: const Text('Go to First Screen'),
//         // ),
//       ),
//     );
//   }
// }
