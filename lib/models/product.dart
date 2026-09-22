// class product
class Product {
  final int id;
  final String category;
  final String name;
  double price;
  String imageUrl;
  int stock;
  String? description;

  //constructor
  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.stock,
    this.description,
  });

  // tambahan method (tugas mandiri)
  String getStatusStok() => labelStatusProduk(stock);

  // method cetak informasi
  String info() {
    return 'ID : $id | Nama : $name | Harga : ${formatRupiah(price)} | '
        'Kategori : $category | Stok : $stock | '
        'Status: ${getStatusStok()} | '
        'Deskripsi : ${description ?? "Tidak ada deskripsi"}';
  }
}

// class turunan
class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required int id,
    required String name,
    required double price,
    required String imageUrl,
    required String category,
    required int stock,
    String? description,
    required this.discountPercent,
  }) : super(
         id: id,
         name: name,
         price: price,
         imageUrl: imageUrl,
         category: category,
         stock: stock,
         description: description,
       );

  double hitungHargaFinal() {
    return hitungHargaSetelahDiskon(price, persenDiskon: discountPercent);
  }

  @override
  String info() {
    return '${super.info()} | Diskon : $discountPercent% |'
        'Harga Final : ${formatRupiah(hitungHargaFinal())}';
  }
}

//function if else
String labelStatusProduk(int stokBarang) {
  if (stokBarang <= 0) {
    return 'Habis';
  } else if (stokBarang < 5) {
    return 'Stok Terbatas';
  } else {
    return 'Tersedia';
  }
}

// function switch case
double hitungDiskonKategori(String kategori) {
  switch (kategori.toLowerCase()) {
    case 'elektronik':
      return 10.0;

    case 'fashion':
      return 15.0;

    case 'makanan':
      return 5.0;

    default:
      return 0.0;
  }
}

// function hitung harga setelah diskon
double hitungHargaSetelahDiskon(double harga, {double persenDiskon = 0}) {
  double potongan = harga * persenDiskon / 100;
  double hargaAkhir = harga - potongan;
  return hargaAkhir;
}

// function format rupiah
String formatRupiah(double angka) => 'Rp ${angka.toStringAsFixed(0)}';

//function hitungtotalbelanja (tugas mandiri 3)
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;
  for (var produk in keranjang) {
    total += produk.price;
  }
  return total;
}