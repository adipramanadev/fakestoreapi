import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/landingpage/landingpage.dart';

class Launcherpage extends StatefulWidget {
  const Launcherpage({super.key});

  @override
  State<Launcherpage> createState() => _LauncherpageState();
}

class _LauncherpageState extends State<Launcherpage> {
  startLaunching() {
    var duration = const Duration(seconds: 1);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const LandingPage();
        }),
      );
    });
  }

  @override
  void initState() {
    startLaunching();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://fakestoreapi.com/icons/logo.png',
          height: 100.0,
          width: 100.0,
        ),
      ),
    );
  }
}
