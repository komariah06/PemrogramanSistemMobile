import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final String status;

  const StockBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color warna;
    if (status == 'Tersedia') {
      warna = Colors.green;
    } else if (status == 'Stok Terbatas') {
      warna = Colors.orange;
    } else {
      warna = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: warna.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: warna, width: 1),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: warna,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
