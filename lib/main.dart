import 'package:flutter/material.dart';
import 'package:game_of_thrones/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // add api: https://gameofthronesquotes.xyz/
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}