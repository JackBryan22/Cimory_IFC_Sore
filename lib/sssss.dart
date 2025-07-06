import 'package:flutter/material.dart';
import 'package:tugas/widget/elevated_but.dart';
import 'package:tugas/widget/dialog_widget.dart';
import 'package:tugas/providers/acc_prov.dart';
import 'package:provider/provider.dart';

class VerifikasiScreen extends StatelessWidget {
  final String nama;
  final String jumlahD;
  final TextEditingController _controller = TextEditingController();

  VerifikasiScreen({super.key, required this.nama, required this.jumlahD});

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Verifikasi')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $nama'),
            const SizedBox(height: 10),
            Text('Jumlah: Rp $jumlahD'),
            const SizedBox(height: 30),
            elevatedbut(
              label: 'Konfirmasi Donasi',
              press: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:
                      (_) => dialogNotif(label: 'Berhasil Melakukan Donasi!', label2: '',),
                );
              },
              backColor: Colors.blue,
              foregColor: Colors.white,
              ukuran: Size(100, 40),
            ),
          ],
        ),
      ),
    );
  }
}
