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

void main() {
  // var final const
  var namaProdukVar = 'Laptop Lenovo';
  print("Sebelum : $namaProdukVar");
  namaProdukVar = 'Laptop HP';
  print("Sesudah : $namaProdukVar");
  final tanggal = DateTime.now();
  print("Tanggal : $tanggal");
  const namaToko = "Toko Kita";
  print("Nama toko : $namaToko");

  // variabel dan tipe data
  int stok = 15;
  double harga = 10000000;
  String namaProduk = "Laptop HP";
  bool status = true;

  print("Stok : $stok");
  print("Harga : $harga");
  print("Nama produk : $namaProduk");
  print("Status : ${status ? 'Tersedia' : 'Tidak Tersedia'}");

  // list string & map string
  List<String> daftarKategori = ['Elektronik', 'Fashion', 'Makanan'];
  print('Daftar kategori: $daftarKategori');
  print('Kategori pertama: ${daftarKategori[0]}');
  print('Jumlah kategori: ${daftarKategori.length}');

  Map<String, dynamic> produkMentah = {
    'id': 1,
    'nama': "Laptop HP",
    'harga': 10000000,
    'stok': 15,
    'kategori': "Elektronik",
  };
  print('Produk mentah: $produkMentah');
  print('Nama dari map: ${produkMentah['nama']}');
  print('Harga dari map: ${produkMentah['harga']}');

  // // operator aritmatika
  double hargaBarang = 10000000;
  int stokBarang = 15;
  int jumlahBeli = 2;
  print("Harga Barang : $hargaBarang");
  print("Stok : $stokBarang");
  print("Jumlah Beli : $jumlahBeli");
  print(" ");

  double totalHarga = hargaBarang * jumlahBeli;
  print("Total Harga = $totalHarga");

  int sisaStok = stokBarang - jumlahBeli;
  print("Sisa Stok = $sisaStok");

  double tambahan = 100000;
  double totalTambah = totalHarga + tambahan;
  print("Total + Biaya Tambahan ($tambahan) : $totalTambah");

  double hargaPerItem = totalHarga / jumlahBeli;
  print("Harga PerItem : $hargaPerItem");

  double sisaBagi = hargaBarang % 100000;
  print("Sisa Bagi % 100000 : $sisaBagi");
  print(" ");

  // //operator perbandingan
  double hargaProdukA = 100000000;
  double hargaProdukB = 8000000;
  int stokProdukA = 15;
  int stokProdukB = 10;
  print("Harga A : $hargaProdukA");
  print("Harga B : $hargaProdukB");
  print("Stok A : $stokProdukA");
  print("Stok B : $stokProdukB");
  print(" ");

  bool samaHarga = hargaProdukA == hargaProdukB;
  print("Harga A == Harga B ? $samaHarga");

  bool bedaHarga = hargaProdukA != hargaProdukB;
  print("Harga A != Harga B ? $bedaHarga");

  bool hargaALebihMahal = hargaProdukA > hargaProdukB;
  print("Harga A > Harga B ? $hargaALebihMahal");

  bool hargaALebihMurah = hargaProdukA < hargaProdukB;
  print("Harga A < Harga B ? $hargaALebihMurah");

  bool stokASamaAtauLebih = stokProdukA >= stokProdukB;
  print("Stok A >= StokB ? $stokASamaAtauLebih");

  bool stokBSamaAtauKurang = stokProdukB <= stokProdukA;
  print("Stok B <= Stok A ? $stokBSamaAtauKurang");
  print(" ");

  // Operator Logika
  bool tersedia = true;
  print("Harga Barang : $hargaBarang");
  print("Stok : $stokBarang");
  print(" ");

  bool layakTampil = stokBarang > 0 && hargaBarang > 0;
  print("stok > 0 && harga > 0 ? $layakTampil");

  bool butuhRestok = stokBarang == 0 || stokBarang < 3;
  print("Stok == 0 || stok < 3 ? $butuhRestok");

  bool tidakTersedia = !tersedia;
  print("!tersedia ? $tidakTersedia");

  bool siapJual = (stokBarang > 0 && hargaBarang > 0) && tersedia;
  print("Siap Jual ? $siapJual");

  // status stokproduk
  print("Status Stok Produk : ${labelStatusProduk(stokBarang)}");
  print(" ");

  // for
  List<double> hargaBelanja = [10000000, 20000000, 30000000];

  double totalBelanja = 0;
  for (int i = 0; i < hargaBelanja.length; i++) {
    totalBelanja += hargaBelanja[i];
  }

  print("Daftar harga belanja : $hargaBelanja");
  print("Total Belanja : $totalBelanja");
  print(" ");

  // while
  int simulasiStok = stokBarang;

  print("Mulai Simulasi : ");
  while (simulasiStok > 0) {
    print("Stok sekarang : $simulasiStok");
    simulasiStok--;
  }

  print("stok habis");
  print("stok asli : $stokBarang");
  print(" ");

  // diskon kategori
  print('Diskon kategori Elektronik: ${hitungDiskonKategori('Elektronik')}%');
  print('Diskon kategori Fashion: ${hitungDiskonKategori('Fashion')}%');
  print('Diskon kategori Makanan: ${hitungDiskonKategori('Makanan')}%');
  print('Diskon kategori Lainnya: ${hitungDiskonKategori('Olahraga')}%');
  print(" ");

  // simulasi diskon
  String kategori = 'elektronik';

  double persenDiskon = hitungDiskonKategori(kategori);

  print('Kategori: $kategori');
  print('Harga awal: ${formatRupiah(harga)}');
  print('Diskon: $persenDiskon%');
  print(
    'Harga setelah diskon: ${formatRupiah(hitungHargaSetelahDiskon(harga, persenDiskon: persenDiskon))}',
  );

  //tanpa argumen diskon (default 0)
  double hargaTanpaDiskon = hitungHargaSetelahDiskon(harga);
  print('Tanpa diskon: ${formatRupiah(hargaTanpaDiskon)}');

  //dengan argumen diskon
  double hargaDiskonElektronik = hitungHargaSetelahDiskon(
    harga,
    persenDiskon: hitungDiskonKategori('elektronik'),
  );
  print('Diskon Elektronik: ${formatRupiah(hargaDiskonElektronik)}');

  // panggil manual
  double hargaDiskonManual = hitungHargaSetelahDiskon(harga, persenDiskon: 10);
  print('Diskon 25%: ${formatRupiah(hargaDiskonManual)}');
  print(" ");

  //  arrow function formatRupiah
  print('Format rupiah 1000000: ${formatRupiah(1000000)}');
  print('Format rupiah 7500000: ${formatRupiah(7500000)}');
  print('Format rupiah 425000: ${formatRupiah(425000)}');

  // tes class produk
  Product produk1 = Product(
    id: 1,
    name: 'Laptop HP',
    price: 10000000,
    imageUrl: 'https://share.google/B3dxCXU8phkm6Sh0p',
    category: 'Elektronik',
    stock: 15,
    description: 'Laptop untuk coding',
  );

  print("Class Product");
  print('Produk 1: ${produk1.name} - ${produk1.price}');
  print(" ");

  // tes discountedproduct
  String kategoriDiskon = 'fashion';
  DiscountedProduct produkDiskon = DiscountedProduct(
    id: 2,
    name: 'Sepatu Olahraga Nike',
    price: 500000,
    imageUrl: 'https://share.google/QGRC4eDmcdhiSAtaT',
    category: kategoriDiskon,
    stock: 8,
    description: 'Sepatu diskon',
    discountPercent: hitungDiskonKategori(kategoriDiskon),
  );

  print("DiscountedProduct");
  print('Nama: ${produkDiskon.name}');
  print('Kategori: ${produkDiskon.category}');
  print('Harga: ${produkDiskon.price}');
  print('Diskon: ${produkDiskon.discountPercent}%');
  print('Harga final: ${produkDiskon.hitungHargaFinal()}');
  print(" ");

  //insctance
  Product product1 = Product(
    id: 1,
    name: 'Laptop Asus',
    price: 7500000,
    imageUrl: 'https://example.com/laptop.png',
    category: 'Elektronik',
    stock: 10,
    description: 'Laptop untuk coding dan desain.',
  );

  Product product2 = Product(
    id: 2,
    name: 'Kaos Polos',
    price: 75000,
    imageUrl: 'https://example.com/kaos.png',
    category: 'Fashion',
    stock: 3,
    // description sengaja tidak diisi agar null
  );

  DiscountedProduct product3 = DiscountedProduct(
    id: 3,
    name: 'Sepatu Olahraga',
    price: 500000,
    imageUrl: 'https://example.com/sepatu.png',
    category: 'Fashion',
    stock: 8,
    description: 'Sepatu diskon.',
    discountPercent: hitungDiskonKategori('Fashion'),
  );

  print(product1.info());
  print(product2.info());
  print(product3.info());

  // null & nullable
  Product productNullDesc = Product(
    id: 4,
    name: 'Produk Tanpa Deskripsi',
    price: 100000,
    imageUrl: 'https://example.com/x.png',
    category: 'Fashion',
    stock: 5,
    description: null,
  );

  print("Nullable");
  print(productNullDesc.info());
  print(" ");

  // tes getStatusStok
  Product tesStok1 = Product(
    id: 100,
    name: 'Produk A',
    price: 10000,
    imageUrl: 'https://example.com/a.png',
    category: 'Fashion',
    stock: 0,
  );
  print('${tesStok1.name} → ${tesStok1.getStatusStok()}');

  Product tesStok2 = Product(
    id: 101,
    name: 'Produk B',
    price: 10000,
    imageUrl: 'https://example.com/b.png',
    category: 'Fashion',
    stock: 3,
  );
  print('${tesStok2.name} → ${tesStok2.getStatusStok()}');

  Product tesStok3 = Product(
    id: 102,
    name: 'Produk C',
    price: 10000,
    imageUrl: 'https://example.com/c.png',
    category: 'Fashion',
    stock: 10,
  );
  print('${tesStok3.name} → ${tesStok3.getStatusStok()}');

  // list 8 produk dummy (tugas mandiri 2)
  List<Product> daftarProduk = [
    Product(
      id: 1,
      name: 'Laptop Asus',
      price: 7500000,
      imageUrl: 'https://example.com/laptop.png',
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

  print('----- Daftar Produk Toko Kita -----');
  for (var produk in daftarProduk) {
    print(produk.info());
  }
  print(" ");

  // total belanja (tugas mandiri 3)
  double totalBelanjaSemua = hitungTotalBelanja(daftarProduk);
  print('Total belanja semua produk: ${formatRupiah(totalBelanjaSemua)}');
  print(" ");
}
