//langkah 5
import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Keranjang masih kosong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Dilengkapi di praktikum berikutnya',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
