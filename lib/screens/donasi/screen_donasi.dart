import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/model/etalase_model.dart';
import 'package:tugas/screens/donasi/verifikasi.dart';
import 'package:tugas/widget/elevated_but.dart';
import 'package:tugas/providers/acc_prov.dart';
import 'package:tugas/widget/dialog_widget.dart';

class DonationScreen extends StatefulWidget {
  final Product product;
  DonationScreen({super.key, required this.product});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isChecked = false;
  double _jumlahDonasi = 0;
  @override
  void initState() {
    super.initState();
    _controller.text = _jumlahDonasi.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final account = Provider.of<AccountProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Donasi')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nama Donatur'),
            ),
            SizedBox(height: 16),
            Text('Saldo Saat Ini: Rp ${account.saldo.toStringAsFixed(2)}'),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah Donasi'),
              onChanged: (value) {
                final parsed = double.tryParse(value);
                if (parsed != null && parsed >= 0 && parsed <= account.saldo) {
                  setState(() {
                    _jumlahDonasi = parsed;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            Slider(
              min: 0,
              max: account.saldo < 1000 ? 1000 : account.saldo,
              value: _jumlahDonasi.clamp(0, account.saldo),
              divisions:
                  (account.saldo / 1000).floor() > 0
                      ? (account.saldo / 1000).floor()
                      : null,
              onChanged: (value) {
                setState(() {
                  _jumlahDonasi = (value / 1000).round() * 1000;
                  _controller.text = _jumlahDonasi.toStringAsFixed(0);
                });
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'Saya menyatakan bahwa saya benar-benar ingin berdonasi',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            elevatedbut(
              label: 'Donasi Sekarang',
              press: () {
                final nama = _nameController.text.trim();
                final amount = double.tryParse(_controller.text);
                if (nama.isEmpty || amount == null || amount <= 0) {
                  showDialog(
                    context: context,
                    builder:
                        (context) => dialogNotif(
                          ikon: const Icon(Icons.cancel),
                          warna: Colors.red,
                          label: 'Input Tidak Valid!',
                          label2:
                              'Nama dan jumlah donasi harus diisi dengan benar.',
                        ),
                  );
                  return;
                }

                if (!isChecked) {
                  showDialog(
                    context: context,
                    builder:
                        (context) => dialogNotif(
                          ikon: const Icon(Icons.cancel),
                          warna: Colors.red,
                          label: 'Konfirmasi Donasi',
                          label2:
                              'Anda harus menyatakan persetujuan terlebih dahulu.',
                        ),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => VerifikasiScreen(
                          nama: _nameController.text,
                          jumlahD: _controller.text,
                          product: product,
                        ),
                  ),
                );
              },
              backColor: Colors.blue,
              foregColor: Colors.white,
              ukuran: Size(500, 50),
            ),
          ],
        ),
      ),
    );
  }
}
