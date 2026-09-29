import 'package:flutter/material.dart';

import '../models/product.dart';

class PriceLabel extends StatelessWidget {
  final double harga;

  const PriceLabel({super.key, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Text(
      formatRupiah(harga),
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    );
  }
}
