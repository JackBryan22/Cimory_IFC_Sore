import 'package:flutter/material.dart';
import 'package:tugas/widget/dialog_widget.dart';
import 'package:tugas/screens/pembayaran/saldo.dart';

class PilihMetodePage extends StatelessWidget {
  const PilihMetodePage({Key? key}) : super(key: key);

  void _showEMoneyOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih E-Money',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.purple,
                ),
                title: Text('OVO'),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => IsiSaldoPage(),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.lightBlue,
                ),
                title: Text('DANA'),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => IsiSaldoPage(),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.green,
                ),
                title: Text('GoPay'),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => IsiSaldoPage(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBankOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih Bank',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.account_balance, color: Colors.blue),
                title: Text('BCA'),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => IsiSaldoPage(),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance, color: Colors.indigo),
                title: Text('Mandiri'),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => IsiSaldoPage(),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance, color: Colors.red),
                title: Text('BRI'),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => IsiSaldoPage(),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance, color: Colors.teal),
                title: Text('Permata'),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => IsiSaldoPage(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilih Metode Pembayaran')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Pilih metode pengisian saldo:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.blue,
            ),
            title: Text('E-Money'),
            subtitle: Text('OVO, DANA, GoPay, dll'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              _showEMoneyOptions(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance, color: Colors.green),
            title: Text('Transfer Bank'),
            subtitle: Text('BCA, Mandiri, BRI, Permata'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              _showBankOptions(context);
            },
          ),
        ],
      ),
    );
  }
}
