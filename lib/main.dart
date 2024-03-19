import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisatajogja/screen/detail_screen.dart';
import 'package:wisatajogja/screen/main_screen.dart';
import 'package:wisatajogja/model/tourism_place.dart';
import 'package:wisatajogja/provider/themeProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() => runApp(const MainApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const String title = 'Wisata Jogja';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Themeprov()..init(),
      child: Consumer<Themeprov>(builder: (context, notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dark Theme',
          //By default theme setting, you can also set system
          // when your mobile theme is dark the app also become dark

          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,

          //Our custom theme applied
          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MainScreen(),
        );
      }),
    );
  }
}
