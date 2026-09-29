import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //   //langkah 1 poin 3
  //   @override
  //   Widget build(BuildContext context) {
  //     // TODO: implement build
  //     return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: const HomePage(),
  //     );
  //   }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
