import 'package:adventurista/Constants/colors.dart';
import 'package:adventurista/Views/login_view.dart';
import 'package:adventurista/Views/menu_view.dart';
import 'package:adventurista/Views/principal_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Palette.advBlue,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Palette.advBlue,
      systemNavigationBarIconBrightness: Brightness.light
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.advBlue,
      ),
      // home: const LoginView(),
      home: const MenuView(),
      // home: const PrincipalView(),
    );
  }
}

