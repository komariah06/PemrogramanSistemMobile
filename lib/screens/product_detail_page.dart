// langkah 1 
import 'package:flutter/material.dart';

import '../models/product.dart';
// tugas mandiri 1 
import '../widgets/category_tag.dart';
import '../widgets/price_label.dart';
import '../widgets/stock_badge.dart';

// langkah 3 poin 2 → ubah jadi StatefulWidget karena ada counter jumlah
class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // langkah 3  
  int _jumlah = 1;

  // langkah 3
  void _tambah() {
    setState(() => _jumlah++);
  }

  // langkah 3
  void _kurang() {
    if (_jumlah > 1) setState(() => _jumlah--);
  }

  // langkah 3 
  void _tambahKeKeranjang() {
    Navigator.pop(context, _jumlah);
  }

  @override
  Widget build(BuildContext context) {
    // langkah 3 
    final product = widget.product;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          //langkah 1
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.image, size: 80, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // tugas mandiri 1 
            PriceLabel(harga: product.price),
            const SizedBox(height: 8),

            CategoryTag(category: product.category),
            const SizedBox(height: 8),

            StockBadge(status: product.getStatusStok()),
            const SizedBox(height: 16),

            const Text(
              'Deskripsi : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(product.description ?? 'Tidak ada deskripsi'),

            // langkah 3
            const SizedBox(height: 32),
            Row(
              children: [
                const Text('Jumlah:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: _kurang,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(
                  '$_jumlah',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: _tambah,
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // langkah 3
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _tambahKeKeranjang,
                icon: const Icon(Icons.add_shopping_cart),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('TAMBAH KE KERANJANG'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}