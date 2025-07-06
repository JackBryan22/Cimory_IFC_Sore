import 'package:flutter/material.dart';
import 'package:tugas/model/etalase_model.dart';
import 'package:tugas/screens/mainskrin.dart';
import 'package:tugas/widget/elevated_but.dart';
import 'package:tugas/widget/dialog_widget.dart';
import 'package:tugas/providers/acc_prov.dart';
import 'package:provider/provider.dart';
import 'package:tugas/providers/donation_prov.dart';
import 'package:tugas/providers/etalase_provider.dart';

class VerifikasiScreen extends StatefulWidget {
  final String nama;
  final String jumlahD;
  final Product product;

  VerifikasiScreen({
    super.key,
    required this.nama,
    required this.jumlahD,
    required this.product,
  });

  @override
  State<VerifikasiScreen> createState() => _VerifikasiScreen();
}

class _VerifikasiScreen extends State<VerifikasiScreen> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final account = Provider.of<AccountProvider>(context);
    final historyProvider = Provider.of<DonationProvider>(context);
    final jumlah = double.tryParse(widget.jumlahD);
    final donasiProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Verifikasi')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${widget.nama}'),
            const SizedBox(height: 10),
            Text('Jumlah: Rp ${widget.jumlahD}'),
            const SizedBox(height: 30),
            elevatedbut(
              label: 'Konfirmasi Donasi',
              press: () {
                if (jumlah != null && jumlah > 0) {
                  final berhasil = account.donasi(jumlah);

                  if (berhasil) {
                    historyProvider.addDonation(
                      widget.nama,
                      jumlah.toInt(),
                      product.name,
                    );
                    final index = donasiProvider.products.indexWhere(
                      (p) => p.name == product.name,
                    );

                    donasiProvider.donasiKeProduk(index, jumlah);

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (_) => dialogNotif(
                            ikon: const Icon(Icons.check_circle),
                            warna: Colors.green,
                            label: 'Berhasil Melakukan Donasi!',
                            label2: '',
                            lok: MainScreen(),
                          ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder:
                          (_) => dialogNotif(
                            ikon: const Icon(Icons.cancel),
                            warna: Colors.red,
                            label: 'Saldo Tidak Cukup Untuk Donasi',
                            label2: '',
                            lok: MainScreen(),
                          ),
                    ).then((_) {
                      Navigator.pop(context);
                    });
                  }
                } else {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder:
                        (_) => dialogNotif(
                          ikon: const Icon(Icons.cancel),
                          warna: Colors.red,
                          label: 'Input Tidak Valid!',
                          label2: 'Jumlah donasi tidak boleh kosong atau 0.',
                          lok: MainScreen(),
                        ),
                  ).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
              backColor: Colors.blue,
              foregColor: Colors.white,
              ukuran: const Size(100, 40),
            ),
          ],
        ),
      ),
    );
  }
}
