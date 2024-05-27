import 'package:flutter/material.dart';
import 'package:wisatajogja/constants/image_constant.dart';
import 'package:wisatajogja/screen/main_screen.dart';
// import 'package:sehatjantungku/constants/image_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100.0,
          child: Image.asset(ImageConstant.logoApp),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:wisatajogja/screen/main_screen.dart';
// import 'package:sehatjantungku/constants/image_constant.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key key}) : super(key: key); // Corrected constructor syntax

//   @override
//   Widget build(BuildContext context) {
//     // Use WidgetsBinding.instance.addPostFrameCallback for navigation after delay
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // Use Navigator.pushReplacementNamed to navigate to the main screen
//       Navigator.pushReplacementNamed(context, '/main_screen');
//     });

//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 100.0,
//           child: Image.asset(ImageConstant.logoApp),
//         ),
//       ),
//     );
//   }
// }

