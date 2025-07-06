import 'package:flutter/material.dart';

class DonationProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _history = [
    {
      "name": "James",
      "total_donasi": 200000,
      "nama_donasi": "Warga Berebut Makanan di Rafah",
    },
    {
      "name": "Lebron",
      "total_donasi": 202000,
      "nama_donasi": "Anak-anak Gaza Menunggu Makanan Berbuka",
    },
    {
      "name": "Kobe",
      "total_donasi": 250000,
      "nama_donasi": "Anak-anak Palestina Kekurangan Gizi",
    },
    {
      "name": "Curry",
      "total_donasi": 2000000,
      "nama_donasi": "Antrean Bantuan di Khan Younis",
    },
  ];

  List<Map<String, dynamic>> get history => _history;

  void addDonation(String name, int amount, String namaDonasi) {
    _history.add({
      "name": name,
      "total_donasi": amount,
      "nama_donasi": namaDonasi,
    });
    notifyListeners();
  }
}
