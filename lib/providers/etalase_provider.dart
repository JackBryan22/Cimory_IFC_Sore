import 'package:flutter/material.dart';
import 'package:tugas/model/etalase_model.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
  name: "Anak-anak Gaza Menunggu Makanan Berbuka",
  imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIIp9vrhr67w9rpvye1MiFCx-scTTk0C40ug&s",
  total_donasi: 2500000,
  target_donasi: 8000000,
  deskripsi: "Anak-anak Gaza duduk menanti datangnya waktu berbuka dengan harapan mendapatkan makanan yang layak di tengah keterbatasan.",
  kategori: "Anak-anak",
),
Product(
  name: "Warga Berebut Makanan di Rafah",
  imageUrl: "https://img.kitabisa.cc/size/650/3462cc76-e6e5-4322-9b46-13e0b0fbdb57.jpg",
  total_donasi: 1800000,
  target_donasi: 7000000,
  deskripsi: "Warga Rafah berebut makanan bantuan sebagai bentuk perjuangan mereka untuk bertahan hidup di tengah krisis kemanusiaan.",
  kategori: "Warga Dewasa",
),
Product(
  name: "Anak-anak Antre Makanan",
  imageUrl: "https://awsimages.detik.net.id/community/media/visual/2024/02/06/ekspresi-anak-anak-gaza-saat-antre-makanan-1_169.jpeg?w=700&q=90",
  total_donasi: 3200000,
  target_donasi: 9000000,
  deskripsi: "Anak-anak Palestina berbaris panjang dengan sabar menunggu giliran mendapatkan makanan dari dapur umum.",
  kategori: "Anak-anak",
),
Product(
  name: "Anak-anak Palestina Kekurangan Gizi",
  imageUrl: "https://pict.sindonews.net/dyn/1280/salsabila/photo/2024/06/25/1/58481/potret-bocah-palestina-kekurangan-gizi-di-jalur-gaza-selatan-tnw.JPG",
  total_donasi: 2100000,
  target_donasi: 7500000,
  deskripsi: "Banyak anak-anak di Palestina mengalami kekurangan gizi akibat blokade dan minimnya pasokan makanan bergizi.",
  kategori: "Anak-anak",
),
Product(
  name: "Kepung Gudang Makanan UNRWA",
  imageUrl: "https://akcdn.detik.net.id/visual/2024/03/19/warga-gaza-berebut-bantuan-di-gudang-unrwa-5_169.jpeg?w=1200",
  total_donasi: 1750000,
  target_donasi: 6000000,
  deskripsi: "Warga Gaza mengelilingi gudang makanan milik UNRWA demi mendapatkan bantuan makanan yang sangat dibutuhkan.",
  kategori: "Warga Dewasa",
),
Product(
  name: "Antrean Bantuan di Khan Younis",
  imageUrl: "https://i0.wp.com/www.arrahmah.id/wp/images/stories/2025/04/afp_680ddeee0c2a-1745739502.webp?fit=770%2C513&ssl=1",
  total_donasi: 2600000,
  target_donasi: 8500000,
  deskripsi: "Ratusan warga Khan Younis antre bantuan kemanusiaan di tengah kondisi darurat yang semakin memburuk.",
  kategori: "Warga Dewasa",
),
Product(
  name: "Antre Bantuan Makanan",
  imageUrl: "https://i0.wp.com/www.arrahmah.id/wp/images/stories/2025/04/c55b7a75-37zrx6e46bj4td9jzzeoqg.jpeg?resize=640%2C359&ssl=1",
  total_donasi: 2950000,
  target_donasi: 9500000,
  deskripsi: "Warga Palestina dengan sabar mengantre untuk menerima bantuan makanan yang terbatas jumlahnya.",
  kategori: "Warga Umum",
),
Product(
  name: "Berebut Makanan Berbuka",
  imageUrl: "https://5p4c3.sgp1.cdn.digitaloceanspaces.com/sahabatpedalaman/public/campaign/OysPNOJ9cdoT.jpeg",
  total_donasi: 1850000,
  target_donasi: 5000000,
  deskripsi: "Suasana penuh haru saat warga berebut makanan untuk berbuka puasa di tengah krisis pangan.",
  kategori: "Warga Umum",
),
Product(
  name: "Antre Dapur Amal",
  imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOqjXdU6oqSeRUIkSKsij-z834EzeooQXMEg&s",
  total_donasi: 2200000,
  target_donasi: 6500000,
  deskripsi: "Dapur amal menjadi harapan terakhir warga Gaza yang antre untuk sepiring makanan hangat.",
  kategori: "Dapur Umum",
),
Product(
  name: "Minta Makanan Saat Buka",
  imageUrl: "https://awsimages.detik.net.id/community/media/visual/2024/03/14/potret-warga-palestina-berebut-makanan-di-rafah-6_169.jpeg?w=1200",
  total_donasi: 3100000,
  target_donasi: 10000000,
  deskripsi: "Warga Palestina memohon bantuan makanan menjelang waktu berbuka, mencerminkan krisis kemanusiaan yang mendalam.",
  kategori: "Warga Umum",
),

  ];

  void donasiKeProduk(int index, double jumlah) {
    if (index >= 0 && index < _products.length) {
      _products[index].total_donasi += jumlah;
      notifyListeners();
    }
  }

  double get totalSemuaDonasi =>
      _products.fold(0, (total, item) => total + item.total_donasi);
  

  String _selectedCategory = 'Tampilkan Semua';
  String _selectedSort = '';
  String _searchQuery = '';
  Product? _selectedProduct;
  List<Product> get products {
    List<Product> filtered = _products;

    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      filtered =
          filtered.where((p) {
            return p.name.toLowerCase().contains(q) ||
                p.kategori.toLowerCase().contains(q);
          }).toList();
    }

    if (_selectedCategory != 'Tampilkan Semua') {
      filtered =
          filtered.where((p) => p.kategori == _selectedCategory).toList();
    }

    if (_selectedSort.isNotEmpty) {
      if (_selectedSort == 'Terbaru' || _selectedSort == 'Progress Donasi') {
        filtered.sort((a, b) => b.total_donasi.compareTo(a.total_donasi));
      }
    }

    return filtered;
  }
Product? get selectedProduct => _selectedProduct;

  void selectProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }
  void updateFilter({
    String category = '',
    String sort = '',
    String searchQuery = '',
  }) {
    print('UpdateFilter => category: $category');

    if (category.isNotEmpty) {
      _selectedCategory = category;
    }

    _searchQuery = searchQuery;
    _selectedSort = sort;
    notifyListeners();
  }


}
