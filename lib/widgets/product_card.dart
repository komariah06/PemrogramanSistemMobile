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
class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  //initstate
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('[initState] ProductCard "${widget.product.name}" dibuat');
  }

  //dispose
  @override
  void dispose() {
    // TODO: implement dispose
    print('[dispose] ProductCard "${widget.product.name}" dihapus');
    super.dispose();
  }

  // tombol favorit
  void tombolFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    print('[setState] "${widget.product.name}" -> isFavorit = $isFavorite');
  }

  //build
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('[build] ProductCard "${widget.product.name}" dirender');
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //tombol favorit
        Stack(
          children: [
            Container(
              height: 110,
              width: double.infinity,
              color: Colors.blueAccent.shade200,
              child: const Icon(Icons.image, size: 48, color: Colors.indigo),
            ),
            //posisi
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
                  onPressed: tombolFavorite,
                ),
              ),
            ),
          ],
        ),


          //nama dan harga
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // Text(
                //   formatRupiah(widget.product.price),
                //   style: const TextStyle(
                //     color: Colors.green,
                //     fontWeight: FontWeight.w600,
                //     fontSize: 14,
                //   ),
                // ),

                // category tag
                CategoryTag(category: widget.product.category),

                const SizedBox(height: 4),

                //price label
                PriceLabel(harga: widget.product.price),

                const SizedBox(height: 6),

                //badge status
                StockBadge(status: widget.product.getStatusStok()),
              ],
            ),
          ),
        ],
      ),
    );

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
}
