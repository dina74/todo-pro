import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';

class SpalshScreen extends StatelessWidget {
  static const routName = '/';

  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.fitWidth),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
