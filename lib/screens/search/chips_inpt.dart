import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/providers/etalase_provider.dart';
import 'package:tugas/screens/mainskrin.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String selectedSort = '';
  String selectedCategory = 'Tampilkan Semua';

  final List<String> sortOptions = [
    'Terbaru',
    'Progress Donasi',
    'Trending',
    'Akan Berakhir',
  ];

  final List<String> categoryOptions = [
    'Tampilkan Semua',
    'Warga Umum',
    'Dapur Umum',
    'Warga Dewasa',
    'Anak-anak',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Urutkan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              children:
                  sortOptions.map((option) {
                    return ChoiceChip(
                      label: Text(option),
                      selected: selectedSort == option,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedSort = selected ? option : '';
                        });
                      },
                    );
                  }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              "Kategori",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  categoryOptions.map((category) {
                    return ChoiceChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCategory =
                              selected ? category : 'Tampilkan Semua';
                          print('selectedCategory: $selectedCategory');
                        });
                      },
                    );
                  }).toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                print('KIRIM KE PROVIDER => $selectedCategory');
                final provider = Provider.of<ProductProvider>(
                  context,
                  listen: false,
                );
                provider.updateFilter(
                  category: selectedCategory,
                  sort: selectedSort,
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Terapkan'),
            ),
          ],
        ),
      ),
    );
  }
}
