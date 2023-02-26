import 'package:flutter/material.dart';
import 'package:movies/modules/movies/presentation/screens/movies_screen.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const MoviesScreen(),
    );
  }
}