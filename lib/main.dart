import 'package:flutter/material.dart';
import 'package:movie_app/screens/slash.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Movie App',
       debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromRGBO(29, 53, 87,1), ).copyWith(background:Color.fromRGBO(29, 53, 87,1),),
    ),
  home: const SplashScreen(),
    );
  }
}