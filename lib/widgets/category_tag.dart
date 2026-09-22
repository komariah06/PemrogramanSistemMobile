import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  final String category;

  const CategoryTag({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Color warna;
    if (category == 'Elektronik') {
      warna = Colors.deepOrangeAccent;
    } else if (category == 'Fashion') {
      warna = Colors.deepPurpleAccent;
    } else if (category == 'Makanan') {
      warna = Colors.redAccent;
    } else {
      warna = Colors.blueGrey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: warna.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        category,
        style: TextStyle(
          color: warna,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
