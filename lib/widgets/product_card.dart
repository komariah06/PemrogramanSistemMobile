import 'package:flutter/material.dart';
import 'package:tokokita/widgets/category_tag.dart';

import '../models/product.dart';
import 'price_label.dart';
import 'stock_badge.dart';

// stateless
// class ProductCard extends StatelessWidget {
//   final Product product;

//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Placeholder gambar
//           Container(
//             height: 130,
//             width: double.infinity,
//             color: Colors.blueAccent.shade200,
//             child: const Icon(Icons.image, size: 48, color: Color.fromARGB(255, 131, 143, 255)),
//           ),

//           //  Nama & harga
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height:1),

//                 Text(
//                   formatRupiah(product.price),
//                   style: const TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// statefull
class ProductCard extends StatelessWidget {
  final Product product;

  // state favorit sekarang di-lift ke parent (HomePage)
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  Color _warnaStok(String status) {
  switch (status) {
    case 'Habis':
      return Colors.grey;
    case 'Stok Terbatas':
      return Colors.orange;
    default:
      return Colors.green;
  }
}

  //build
  @override
  Widget build(BuildContext context) {
    print('[build] ProductCard "${product.name}" dirender');
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            height: 110,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      const Icon(Icons.image, size: 48, color: Colors.indigo),
                ),

                // tombol favorit 
                Positioned(
                  top: 4,
                  right: 4,
                  child: Material(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    child: IconButton(
                      iconSize: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: onToggleFavorite,
                    ),
                  ),
                ),

                // badge diskon 
                if (product is DiscountedProduct)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 66, 66),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Diskon ${(product as DiscountedProduct).discountPercent.toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // TUGAS MANDIRI 2
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: _warnaStok(product.getStatusStok()),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        product.getStatusStok(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // category tag
                CategoryTag(category: product.category),

                const SizedBox(height: 4),

                // price label
                PriceLabel(harga: product.price),

                const SizedBox(height: 4),

                // badge status
                StockBadge(status: product.getStatusStok()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // percobaan hot reload langkah 4
  // return Container(
  //   decoration: BoxDecoration(
  //     color: Colors.yellow.shade100,
  //     borderRadius: BorderRadius.circular(16),
  //     border: Border.all(color: Colors.orange, width: 2),
  //   ),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       // gambar tanpa tombol favorit (sementara)
  //       Container(
  //         height: 110,
  //         width: double.infinity,
  //         color: Colors.orange.shade300,
  //         child: const Icon(Icons.shopping_bag, size: 48, color: Colors.white),
  //       ),

  //       Padding(
  //         padding: const EdgeInsets.all(8),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               widget.product.name,
  //               style: const TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold,
  //                 fontStyle: FontStyle.italic,
  //               ),
  //             ),
  //             const SizedBox(height: 4),
  //             PriceLabel(harga: widget.product.price),
  //             const SizedBox(height: 6),
  //             StockBadge(status: widget.product.getStatusStok()),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}