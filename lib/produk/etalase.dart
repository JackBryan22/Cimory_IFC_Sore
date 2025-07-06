import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/providers/etalase_provider.dart';
import 'package:tugas/screens/search/searchbar.dart';
import 'package:tugas/providers/darkmd_prov.dart';
import 'package:tugas/produk/produk_detail.dart';
import 'package:tugas/providers/acc_prov.dart';
import 'package:tugas/screens/pembayaran/isi_saldo.dart';

class etalasee extends StatefulWidget {
  const etalasee({super.key});

  @override
  State<etalasee> createState() => _etalasee();
}

class _etalasee extends State<etalasee> {
  menulist(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.share),
              title: const Text('Share'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.favorite_border),
              title: const Text('Favorite'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.report),
              title: const Text('Laporkan'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.block),
              title: const Text('Blokir User'),
            ),
          ),
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final productProvider = Provider.of<ProductProvider>(context);
    final productList = productProvider.products;
    final account = Provider.of<AccountProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,

        elevation: 0,
        shadowColor: Colors.transparent,
        toolbarHeight: 100,
        title: Row(
          children: [
            Builder(
              builder:
                  (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchBars()),
                  );
                },
                icon: Icon(Icons.search, color: textColor),
                label: Text("Cari", style: TextStyle(color: textColor)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  backgroundColor: isDark ? Colors.grey[800] : Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Consumer<AccountProvider>(
              builder: (context, account, _) {
                return UserAccountsDrawerHeader(
                  accountName: Tooltip(
                    message: 'Nama Akun Anda',
                    child: Text(
                      account.nama.isNotEmpty ? account.nama : 'Nama Akun',
                    ),
                  ),
                  accountEmail: Tooltip(
                    message: 'Alamat Email',
                    child: Text(
                      account.email.isNotEmpty
                          ? account.email
                          : 'example@gmail.com',
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    child: Tooltip(
                      message: 'Profil Anda',
                      child: CircleAvatar(
                        child: Text(
                          account.nama.isNotEmpty ? account.nama[0] : 'N',
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.blue),
                );
              },
            ),
            Tooltip(
              message: 'Kembali ke halaman utama',
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Beranda'),
                onTap: () {},
              ),
            ),
            Tooltip(
              message: 'Ubah preferensi aplikasi',
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Pengaturan'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                ),

                Transform.translate(
                  offset: const Offset(0, -60),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.attach_money),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rp ${account.totalDonasi.toStringAsFixed(0)}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Total Donasimu',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.volunteer_activism),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${account.jumlahDonasiBerhasil.toStringAsFixed(0)}x',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Kali Donasi',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_balance_wallet_outlined,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Rp ${account.saldo.toStringAsFixed(2)}',
                                    ),
                                    const SizedBox(width: 8),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    const PilihMetodePage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Isi Saldo',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.phone_android, size: 20),
                                    SizedBox(width: 6),
                                    Text('Kontak kami'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    mainAxisExtent: 330,
                  ),
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    var item = productList[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => ProductDetailScreen(product: item),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: NetworkImage(item.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    item.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    item.deskripsi,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 17.0),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Dana Terkumpul:',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Rp ${item.total_donasi.toStringAsFixed(0)}',
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: LinearProgressIndicator(
                                                    value: (item.total_donasi /
                                                            item.target_donasi)
                                                        .clamp(0.0, 1.0),
                                                    minHeight: 5,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      width: 150,
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 8,
                              bottom: 8,
                              child: menulist(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
