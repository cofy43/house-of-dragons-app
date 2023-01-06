import 'package:flutter/material.dart';
import 'package:game_of_thrones/home.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

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