import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LuasPersegiPanjang(),
    );
  }
}

class LuasPersegiPanjang extends StatefulWidget {
  const LuasPersegiPanjang({super.key});

  @override
  State<LuasPersegiPanjang> createState() => _LuasPersegiPanjangState();
}

class _LuasPersegiPanjangState extends State<LuasPersegiPanjang> {
  final panjang = TextEditingController();
  final lebar = TextEditingController();

  String hasil = '0';

  void hitung() {
    double? p = double.tryParse(panjang.text);
    double? l = double.tryParse(lebar.text);

    if (p == null || l == null || p <= 0 || l <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan angka yang valid!')),
      );
      return;
    }

    setState(() {
      hasil = (p * l).toString();
    });
  }

  @override
  void dispose() {
    panjang.dispose();
    lebar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Luas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Luas Persegi Panjang',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: panjang,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Panjang (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: lebar,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Lebar (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitung,
              child: const Text('Hitung Luas'),
            ),
            const SizedBox(height: 25),
            Text(
              'Hasil: $hasil cm²',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
