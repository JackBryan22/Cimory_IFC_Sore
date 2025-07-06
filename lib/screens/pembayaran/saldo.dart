import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/widget/elevated_but.dart';
import 'package:tugas/providers/acc_prov.dart';
import 'package:tugas/produk/etalase.dart';
import 'package:tugas/screens/mainskrin.dart';

class IsiSaldoPage extends StatefulWidget {
  const IsiSaldoPage({super.key});

  @override
  State<IsiSaldoPage> createState() => _IsiSaldoPage();
}

class _IsiSaldoPage extends State<IsiSaldoPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Isi Saldo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo Saat Ini',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 4),
            Text(
              'Rp ${account.saldo.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 32),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nominal',
                border: OutlineInputBorder(),
                prefixText: 'Rp ',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: elevatedbut(
                label: 'Konfirmasi',
                press: () {
                  double? amount = double.tryParse(_controller.text);
                  if (amount != null && amount > 0) {
                    account.tambahSaldo(amount);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Saldo berhasil ditambahkan!'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  }
                },
                backColor: Colors.blue,
                foregColor: Colors.white,
                ukuran: Size(500, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
