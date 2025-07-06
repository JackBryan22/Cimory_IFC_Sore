import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/screens/search/chips_inpt.dart';
import 'package:tugas/screens/mainskrin.dart';
import 'package:tugas/providers/etalase_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SearchBars());
  }
}

class SearchBars extends StatefulWidget {
  const SearchBars({super.key});

  @override
  State<SearchBars> createState() => _SearchBarsState();
}

class _SearchBarsState extends State<SearchBars> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Center(
              child: Container(
                height: 50,
                width: 450,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Cari',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) async {
                          final searchQuery = _controller.text;

                          final provider = Provider.of<ProductProvider>(
                            context,
                            listen: false,
                          );
                          provider.updateFilter(searchQuery: searchQuery);

                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );

                          provider.updateFilter(searchQuery: '');
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter_list,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FilterPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
