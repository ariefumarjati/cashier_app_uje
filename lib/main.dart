import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kasir Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KasirSederhana(),
    );
  }
}

class KasirSederhana extends StatefulWidget {
  const KasirSederhana({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KasirSederhanaState createState() => _KasirSederhanaState();
}

class _KasirSederhanaState extends State<KasirSederhana> {
  // deklrasi variable
  List<Item> items = [];
  double total = 0.0;

  // deklarasi controller untuk text field
  TextEditingController namaItemController = TextEditingController();
  TextEditingController hargaItemController = TextEditingController();

  // fungsi untuk menambahkan item
  void tambahItem() {
    String nama = namaItemController.text;
    double harga = double.tryParse(hargaItemController.text) ?? 0.0;

    setState(() {
      items.add(Item(nama: nama, harga: harga));
      total += harga;
    });

    // Bersihkan input setelah ditambahkan
    namaItemController.clear();
    hargaItemController.clear();
  }

  // fungsi untuk menghapus item
  void hapusItem(int index) {
    setState(() {
      total -= items[index].harga;
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kasir Sederhana'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index].nama),
                  subtitle: Text('Rp${items[index].harga.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => hapusItem(index),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Total Belanja'),
            subtitle: Text('Rp${total.toStringAsFixed(2)}'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Tambah Item'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: namaItemController,
                            decoration:
                                const InputDecoration(labelText: 'Nama Item'),
                          ),
                          TextField(
                            controller: hargaItemController,
                            decoration:
                                const InputDecoration(labelText: 'Harga'),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            tambahItem();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Tambah'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Batal'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Tambah Item'),
            ),
          ),
        ],
      ),
    );
  }
}

// membuat model Item
class Item {
  final String nama;
  final double harga;

  Item({required this.nama, required this.harga});
}
