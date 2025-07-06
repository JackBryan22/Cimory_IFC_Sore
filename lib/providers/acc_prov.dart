import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  String _nama = '';
  DateTime _tanggalLahir = DateTime.now();
  String _jenisKelamin = '';
  String _noHp = '';
  String _email = '';
  String _alamat = '';
  String _desk = '';
  double _saldo = 0.0;
  double _totalDonasi = 0.0;
  int _jumlahDonasiBerhasil = 0;

  String get nama => _nama;
  DateTime get tanggalLahir => _tanggalLahir;
  String get jenisKelamin => _jenisKelamin;
  String get noHp => _noHp;
  String get email => _email;
  String get alamat => _alamat;
  String get desk => _desk;
  double get saldo => _saldo;
  double get totalDonasi => _totalDonasi;
  int get jumlahDonasiBerhasil => _jumlahDonasiBerhasil;

  void updateProfile({
    required String nama,
    required DateTime tanggalLahir,
    required String jenisKelamin,
    required String noHp,
    required String alamat,
    required String desk,
    required String email,
  }) {
    _nama = nama;
    _tanggalLahir = tanggalLahir;
    _jenisKelamin = jenisKelamin;
    _noHp = noHp;
    _email = email;
    _alamat = alamat;
    _desk = desk;
    notifyListeners();
  }

  void tambahSaldo(double jumlah) {
    _saldo += jumlah;
    notifyListeners();
  }

  void logout() {
    _nama = '';
    _tanggalLahir = DateTime.now();
    _jenisKelamin = '';
    _noHp = '';
    _email = '';
    _alamat = '';
    _desk = '';
    _saldo = 0.0;
    notifyListeners();
  }

  bool donasi(double jumlah) {
    if (jumlah <= _saldo) {
      _saldo -= jumlah;
      _totalDonasi += jumlah;
      _jumlahDonasiBerhasil++;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool get isLoggedIn => _nama.isNotEmpty;
}
