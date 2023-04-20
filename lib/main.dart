import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sivaram_portfolio_web/providers/firebase_projects_provider/provider.dart';
import 'package:sivaram_portfolio_web/screens/splashscreen.dart';

import 'constants.dart';

TextTheme _textTheme =
    GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white).copyWith(
          bodyLarge: const TextStyle(color: bodyTextColor),
          bodyMedium: const TextStyle(color: bodyTextColor),
        );
ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: bgColor,
    canvasColor: bgColor,
    textTheme: _textTheme);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBE6gz0fpfPVolT4XxEY9KX5XgG8uzx35Y",
        authDomain: "flutter-web-app-4b9ad.firebaseapp.com",
        databaseURL:
            "https://flutter-web-app-4b9ad-default-rtdb.firebaseio.com",
        projectId: "flutter-web-app-4b9ad",
        storageBucket: "flutter-web-app-4b9ad.appspot.com",
        messagingSenderId: "91674599974",
        appId: "1:91674599974:web:76eff3c198145b53957ce7",
        measurementId: "G-FNFPT5FJDH"),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FirebaseProjectsProvider())
    ],
    child: MaterialApp(
      home: const MyApp(),
      theme: themeData,
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
