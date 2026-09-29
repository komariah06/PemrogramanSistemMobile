import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<int, bool> favorites = {};

  @override
  Widget build(BuildContext context) {
    // langkah 4 poin 1
    final List<Product> products = [
      DiscountedProduct(
        id: 1,
        name: 'Laptop Asus',
        price: 7500000,
        imageUrl: 'https://www.google.com/imgres?q=laptop%20asus&imgurl=https%3A%2F%2Ffiles.eci.id%2Fdocuments%2Fproduct%2Fweba416jao-vips552sl%2F1669622839-1.webp&imgrefurl=https%3A%2Feci.id%2Fproduct%2F54121%2Fdetail&docid=8xpYDW4e4D4kNM&tbnid=ST6CnBrPMK7gwM&vet=12ahUKEwjopreQ8YCXAxX62TgGHUiMKeIQnPAOegQIKxAA..i&w=800&h=600&hcb=2&ved=2ahUKEwjopreQ8YCXAxX62TgGHUiMKeIQnPAOegQIKxAA',
        category: 'Elektronik',
        stock: 10,
        description: 'Laptop untuk coding dan desain.',
        discountPercent: hitungDiskonKategori('Elektronik'),
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
      DiscountedProduct(
        id: 3,
        name: 'Kaos Polos',
        price: 75000,
        imageUrl: 'https://example.com/kaos.png',
        category: 'Fashion',
        stock: 3,
        discountPercent: hitungDiskonKategori('Fashion'),
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
      DiscountedProduct(
        id: 5,
        name: 'Nasi Goreng',
        price: 25000,
        imageUrl: 'https://example.com/nasgor.png',
        category: 'Makanan',
        stock: 0,
        description: 'Makanan siap saji.',
        discountPercent: hitungDiskonKategori('Makanan'),
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
      Product(
        id: 9,
        name: 'TV Samsung 32"',
        price: 3200000,
        imageUrl: 'https://example.com/tv.png',
        category: 'Elektronik',
        stock: 5,
        description: 'Smart TV LED 32 inci.',
      ),
      DiscountedProduct(
        id: 10,
        name: 'Kemeja Flanel',
        price: 180000,
        imageUrl: 'https://example.com/kemeja.png',
        category: 'Fashion',
        stock: 12,
        description: 'Kemeja flanel lengan panjang.',
        discountPercent: hitungDiskonKategori('Fashion'),
      ),
      Product(
        id: 11,
        name: 'Mie Ayam Bakso',
        price: 20000,
        imageUrl: 'https://example.com/mieayam.png',
        category: 'Makanan',
        stock: 30,
        description: 'Mie ayam dengan bakso sapi.',
      ),
      Product(
        id: 12,
        name: 'Keyboard Mechanical',
        price: 450000,
        imageUrl: 'https://example.com/keyboard.png',
        category: 'Elektronik',
        stock: 7,
        description: 'Keyboard mechanical RGB.',
      ),
      DiscountedProduct(
        id: 13,
        name: 'Celana Jeans',
        price: 250000,
        imageUrl: 'https://example.com/jeans.png',
        category: 'Fashion',
        stock: 4,
        description: 'Celana jeans slim fit.',
        discountPercent: hitungDiskonKategori('Fashion'),
      ),
      Product(
        id: 14,
        name: 'Es Teh Manis',
        price: 8000,
        imageUrl: 'https://example.com/esteh.png',
        category: 'Makanan',
        stock: 50,
        description: 'Es teh manis segar.',
      ),
      Product(
        id: 15,
        name: 'Monitor LG 24"',
        price: 1800000,
        imageUrl: 'https://example.com/monitor.png',
        category: 'Elektronik',
        stock: 3,
        description: 'Monitor IPS 24 inci.',
      ),
      Product(
        id: 16,
        name: 'Topi Baseball',
        price: 65000,
        imageUrl: 'https://example.com/topi.png',
        category: 'Fashion',
        stock: 20,
        description: 'Topi baseball polos.',
      ),
      DiscountedProduct(
        id: 17,
        name: 'Ayam Geprek',
        price: 22000,
        imageUrl: 'https://example.com/geprek.png',
        category: 'Makanan',
        stock: 0,
        description: 'Ayam geprek sambal bawang.',
        discountPercent: hitungDiskonKategori('Makanan'),
      ),
      Product(
        id: 18,
        name: 'Charger Type-C',
        price: 120000,
        imageUrl: 'https://example.com/charger.png',
        category: 'Elektronik',
        stock: 15,
        description: 'Charger fast charging 33W.',
      ),
      Product(
        id: 19,
        name: 'Sandal Jepit',
        price: 35000,
        imageUrl: 'https://example.com/sandal.png',
        category: 'Fashion',
        stock: 2,
        description: 'Sandal jepit karet.',
      ),
      DiscountedProduct(
        id: 20,
        name: 'Jus Alpukat',
        price: 15000,
        imageUrl: 'https://example.com/jusalpukat.png',
        category: 'Makanan',
        stock: 8,
        description: 'Jus alpukat segar.',
        discountPercent: hitungDiskonKategori('Makanan'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Toko Kita',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Belanja jadi lebih mudah',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const Icon(Icons.shopping_cart, size: 28),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    isFavorite: favorites[product.id] ?? false,
                    onToggleFavorite: () {
                      setState(() {
                        favorites[product.id] =
                            !(favorites[product.id] ?? false);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}