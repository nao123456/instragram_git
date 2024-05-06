import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:instragram/screen/ig_screen.dart';

class StoreBox {
  static String tokenBox = '_tokenBox';
  ValueListenable<Box> get listenable => Hive.box(tokenBox).listenable();

  static Future init() async {
    if (!Hive.isBoxOpen(tokenBox)) {
      await Hive.openBox(tokenBox);
    }
  }

  void addFavorite(String key) => Hive.box(tokenBox).put(key, '');
  void remove(String key) => Hive.box(tokenBox).delete(key);
  bool isFavorite(String key) => Hive.box(tokenBox).get(key) != null;

  List<String> getFavoriteList() =>
      Hive.box(tokenBox).keys.map((e) => e.toString()).toList();
}

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('_tokenBox');
  runApp(const MyApp());
}

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram Feed UI Redesign',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const BottomNavigationWidget(),
    );
  }
}
