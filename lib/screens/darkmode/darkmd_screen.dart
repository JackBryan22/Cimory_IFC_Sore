import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/providers/darkmd_prov.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  State<DarkMode> createState() => _SkrinState();
}

class _SkrinState extends State<DarkMode> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProvDark>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Edit Profil',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode Theme'),
                Column(
                  children: [
                    Switch(
                      value: prov.enableDarkMode,
                      activeColor: Colors.green,

                      onChanged: (val) {
                        prov.setBrightness = val;
                      },
                    ),
                    
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
