import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        //accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Colors.black,
              ),
              bodyText2: const TextStyle(
                color: Colors.black,
              ),
            ),
      ),
      home: const Categoriesscreen(),
    );
  }
}
