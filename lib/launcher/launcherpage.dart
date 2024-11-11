import 'package:flutter/material.dart';

class Launcherpage extends StatefulWidget {
  const Launcherpage({super.key});

  @override
  State<Launcherpage> createState() => _LauncherpageState();
}

class _LauncherpageState extends State<Launcherpage> {
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
