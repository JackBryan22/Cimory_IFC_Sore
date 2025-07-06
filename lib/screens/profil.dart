import 'package:flutter/material.dart';
import 'package:tugas/providers/acc_prov.dart';
import 'package:tugas/screenprofil/edit_prof.dart';
import 'package:tugas/screenprofil/verif_identi.dart';
import 'package:tugas/screenprofil/history_donatur.dart';
import 'package:tugas/screens/darkmode/darkmd_screen.dart';
import 'package:provider/provider.dart';
import 'package:tugas/providers/acc_prov.dart';

class propil extends StatefulWidget {
  const propil({Key? key}) : super(key: key);

  @override
  _propilState createState() => _propilState();
}

class _propilState extends State<propil> {
  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountProvider>(context);
    final List<Map<String, dynamic>> profilItems = [
      {
        'label': 'Profil',
        'icon': Icons.person,
        'onPress': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const editProfil()),
          );
        },
      },
      {
        'label': 'Verifikasi Identitas',
        'icon': Icons.credit_card,
        'onPress': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const verifIden()),
          );
        },
      },
      {
        'label': 'History',
        'icon': Icons.history,
        'onPress': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => historyDonasi()),
          );
        },
      },
      {'label': 'Campaign Saya', 'icon': Icons.badge, 'onPress': () {}},
      {
        'label': 'Dark Mode',
        'icon': Icons.dark_mode,
        'onPress': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DarkMode()),
          );
        },
      },
      {'label': 'Favorit Saya', 'icon': Icons.bookmark, 'onPress': () {}},
      {'label': 'Ganti Password', 'icon': Icons.lock_open, 'onPress': () {}},
      {
        'label': 'Nomor Rekening',
        'icon': Icons.account_balance_wallet,
        'onPress': () {},
      },
      {
        'label': 'List Blokir User',
        'icon': Icons.visibility_off,
        'onPress': () {},
      },
      {'isDivider': true},
      {'label': 'Tentang Kami', 'icon': Icons.group, 'onPress': () {}},
      {'label': 'FAQ', 'icon': Icons.live_help, 'onPress': () {}},
      {
        'label': 'Syarat Dan Ketentuan',
        'icon': Icons.assignment,
        'onPress': () {},
      },
      {'label': 'Kontak Kami', 'icon': Icons.phone, 'onPress': () {}},
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [Tab(text: 'Profil'), Tab(text: 'Saldo')],
            labelStyle: TextStyle(fontSize: 16),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: profilItems.length,
              itemBuilder: (context, index) {
                final item = profilItems[index];

                if (item.containsKey('isDivider') && item['isDivider']) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  );
                }

                return ListTile(
                  leading: Icon(item['icon'], color: Colors.blue),
                  title: Text(
                    item['label'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: item['onPress'],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  tileColor: Colors.transparent,
                  visualDensity: VisualDensity.compact,
                );
              },
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    size: 80,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Saldo Anda',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp ${account.saldo.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
