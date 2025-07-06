import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/providers/etalase_provider.dart';
import 'package:tugas/providers/darkmd_prov.dart';
import 'package:tugas/screens/home.dart';
import 'package:tugas/providers/donation_prov.dart';
import 'package:tugas/providers/acc_prov.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ProvDark()),
        ChangeNotifierProvider(create: (_) => DonationProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProvDark>(context);
    return MaterialApp(
      title: 'Tes',
      debugShowCheckedModeBanner: false,
      theme: prov.enableDarkMode == true ? prov.dark : prov.light,
      home: Scaffold(body: utama()),
    );
  }
}
