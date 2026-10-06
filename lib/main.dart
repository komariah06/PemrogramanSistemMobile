import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/main_page.dart';
import 'screens/home_page.dart';
import 'screens/product_detail_page.dart';
import 'screens/login_page.dart';

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
      // home: const HomePage(),
      //langkah 2
      // langkah 5
      // initialRoute: '/home',
      //stelah ditamah login_page, jadi login duluan yg muncul
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MainPage(),
        '/detail': (context) {
          final product = ModalRoute.of(context)!.settings.arguments as Product;
          return ProductDetailPage(product: product);
        },
      },
    );
  }
}
