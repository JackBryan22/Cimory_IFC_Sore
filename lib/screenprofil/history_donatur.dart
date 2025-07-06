import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/providers/donation_prov.dart';

class historyDonasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<DonationProvider>(context).history;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 4),
                const Text(
                  'History Donasi',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children:
            history.map((item) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(item['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Donasi: Rp ${item['total_donasi'].toString()}"),
                    if (item['nama_donasi'] != null)
                      Text("Untuk: ${item['nama_donasi']}"),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
