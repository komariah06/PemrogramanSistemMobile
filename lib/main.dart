import 'package:flutter/material.dart';

import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: 1,
        name: 'Laptop Asus',
        price: 7500000,
        imageUrl: 'https://www.google.com/imgres?q=laptop%20asus&imgurl=https%3A%2F%2Ffiles.eci.id%2Fdocuments%2Fproduct%2Fweba416jao-vips552sl%2F1669622839-1.webp&imgrefurl=https%3A%2F%2Feci.id%2Fproduct%2F54121%2Fdetail&docid=8xpYDW4e4D4kNM&tbnid=ST6CnBrPMK7gwM&vet=12ahUKEwjopreQ8YCXAxX62TgGHUiMKeIQnPAOegQIKxAA..i&w=800&h=600&hcb=2&ved=2ahUKEwjopreQ8YCXAxX62TgGHUiMKeIQnPAOegQIKxAA',
        category: 'Elektronik',
        stock: 10,
        description: 'Laptop untuk coding dan desain.',
      ),
      Product(
        id: 2,
        name: 'Mouse Logitech',
        price: 150000,
        imageUrl: 'https://example.com/mouse.png',
        category: 'Elektronik',
        stock: 25,
        description: 'Mouse wireless.',
      ),
      Product(
        id: 3,
        name: 'Kaos Polos',
        price: 75000,
        imageUrl: 'https://example.com/kaos.png',
        category: 'Fashion',
        stock: 3,
      ),
      Product(
        id: 4,
        name: 'Sepatu Olahraga',
        price: 500000,
        imageUrl: 'https://example.com/sepatu.png',
        category: 'Fashion',
        stock: 8,
        description: 'Sepatu nyaman untuk olahraga.',
      ),
      Product(
        id: 5,
        name: 'Nasi Goreng',
        price: 25000,
        imageUrl: 'https://example.com/nasgor.png',
        category: 'Makanan',
        stock: 0,
        description: 'Makanan siap saji.',
      ),
      Product(
        id: 6,
        name: 'Kopi Susu',
        price: 18000,
        imageUrl: 'https://example.com/kopi.png',
        category: 'Makanan',
        stock: 12,
        // description sengaja tidak diisi → null
      ),
      Product(
        id: 7,
        name: 'Headphone Sony',
        price: 350000,
        imageUrl: 'https://example.com/headphone.png',
        category: 'Elektronik',
        stock: 4,
        description: 'Headphone dengan bass mantap.',
      ),
      Product(
        id: 8,
        name: 'Jaket Hoodie',
        price: 200000,
        imageUrl: 'https://example.com/hoodie.png',
        category: 'Fashion',
        stock: 6,
        description: 'Jaket hoodie bahan fleece.',
      ),
    ]; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Kita'),
      ),
      body: GridView.count(
        crossAxisCount: 2,           // 2 kartu per baris
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 8,          // jarak antar baris
        crossAxisSpacing: 8,         // jarak antar kolom
        childAspectRatio: 0.72,      // rasio lebar:tinggi kartu
        // children: [
        //   ProductCard(product: products.first),
        //   // const Text('Kosong')
        // ],

        children: products
        .map((p) => ProductCard(product: p))
        .toList(),
      ),
    );
  }
}
