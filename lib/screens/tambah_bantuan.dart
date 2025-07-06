import 'package:flutter/material.dart';
import 'package:tugas/widget/elevated_but.dart';

class tambahBantuan extends StatefulWidget {
  const tambahBantuan({super.key});

  @override
  State<tambahBantuan> createState() => _tambahBantuanState();
}

class _tambahBantuanState extends State<tambahBantuan> {
  String _selectedJenis = 'Pribadi';

  @override
  Widget build(BuildContext context) {
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
                 SizedBox(width: 4),
                 Text(
                  'Daftar',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Judul', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                decoration:  InputDecoration(
                  hintText: 'Masukkan judul donasi',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tambah Gambar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Deskripsi', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Tuliskan deskripsi bantuan yang dibutuhkan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Contoh: Balita, Panti',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Jenis Bantuan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedJenis,
                decoration: InputDecoration(border: OutlineInputBorder()),
                items:
                    ['Pribadi', 'Yayasan'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedJenis = newValue!;
                  });
                },
              ),
              SizedBox(height: 24),
              Center(
                child: elevatedbut(
                  label: 'Tambahkan Bantuan',
                  press: () {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        content:  Text('Bantuan berhasil ditambahkan!'),
                        backgroundColor: Colors.green,
                        contentTextStyle: const TextStyle(color: Colors.white),
                        actions: [
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(
                                context,
                              ).hideCurrentMaterialBanner();
                            },
                            child: const Text(
                              'TUTUP',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  backColor: Colors.blue,
                  foregColor: Colors.white,
                  ukuran: const Size(500, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
