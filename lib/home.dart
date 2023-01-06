import 'package:flutter/material.dart';
import 'cards_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
  
}

class _Home extends State<Home> {

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Games of thrones app',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Games of thrones"),
                actions: [
                  IconButton(
                      padding: const EdgeInsets.only(right: 30, top: 2),
                      icon: Icon(
                          _Home.themeNotifier.value == ThemeMode.light
                            ? Icons.ac_unit
                            : Icons.local_fire_department,
                          size: 40,
                      ),
                      onPressed: () {
                        _Home.themeNotifier.value =
                        _Home.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                      },
                  )
                ],
              ),
              body: CardList(),
            ),
          );
        }
    );
  }
  
}