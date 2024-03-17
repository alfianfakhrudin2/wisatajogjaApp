import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisatajogja/screen/detail_screen.dart';
import 'package:wisatajogja/screen/main_screen.dart';
import 'package:wisatajogja/model/tourism_place.dart';
import 'package:wisatajogja/provider/themeProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// void main() => runApp(const MainApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  static const String title = 'Wisata Jogja';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => Themeprov(),
        builder: (context, _) {
          final themeProv = Provider.of<Themeprov>(context);

          return MaterialApp(
            title: 'wisata jogja',
            debugShowCheckedModeBanner: false,
            themeMode: themeProv.themeMode,
            theme: myThemes.lightTheme,
            darkTheme: myThemes.darkTheme,
            home: MainScreen(),
          );
        },
      );
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
