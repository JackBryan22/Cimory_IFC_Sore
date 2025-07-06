import 'package:flutter/material.dart';
import 'package:tugas/widget/elevated_but.dart';
import 'package:tugas/screens/mainskrin.dart';

class dialogNotif extends StatelessWidget {
  dialogNotif({
    super.key,
    required this.label,
    required this.label2,
    required this.ikon,
    required this.warna,
    this.lok,
  });
  String label;
  String label2;
  Icon ikon;
  Color warna;
  final Widget? lok;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(ikon.icon, color: warna, size: 80),
            const SizedBox(height: 20),
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(label2),
            const SizedBox(height: 24),
            elevatedbut(
              label: 'Kembali',
              press: () {
                Navigator.of(context).pop();
                if (lok != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lok!),
                  );
                }
              },

              backColor: Colors.blue,
              foregColor: Colors.white,
              ukuran: const Size(150, 40),
            ),
          ],
        ),
      ),
    );
  }
}
