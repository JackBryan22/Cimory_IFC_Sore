import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/providers/darkmd_prov.dart';

class darkmdd extends StatefulWidget {
  darkmdd({super.key});
  @override
  _darkmddState createState() => _darkmddState();
}

class _darkmddState extends State<darkmdd> {
  Widget build(BuildContext context) {
    final prov = Provider.of<ProvDark>(context);
    return Switch(
      value: prov.enableDarkMode,
      activeColor: Colors.green,
      onChanged: (val) {
        prov.setBrightness = val;
      },
    );
  }
}
