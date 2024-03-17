import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _animateSplashScreen();
  }

  _animateSplashScreen() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    setState(() {
    });
    await Future.delayed(const Duration(seconds: 2), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BottomNavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      
      child: Scaffold(
        body: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}