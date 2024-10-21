import 'package:flutter/material.dart';

class LatihanPage extends StatefulWidget {
  const LatihanPage({super.key});

  @override
  State<LatihanPage> createState() => _LatihanPageState();
}

class _LatihanPageState extends State<LatihanPage> {
  int _counter = 0;

  // Fungsi untuk menambah 5
  void _increment() {
    setState(() {
      _counter += 5;
    });
  }

  // Fungsi untuk mengurangi 3
  void _decrement() {
    setState(() {
      _counter -= 3;
    });
  }

  // Fungsi untuk membagi 3
  void _divideByThree() {
    setState(() {
      if (_counter != 0) {
        _counter ~/= 3; 
      }
    });
  }

  // Fungsi untuk mengalikan 7
  void _multiplyBySeven() {
    setState(() {
      _counter *= 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Latihan 1',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 237, 99, 99),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nilai sekarang: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _increment,
                  child: const Text('+5'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrement,
                  child: const Text('-3'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _divideByThree,
                  child: const Text(':3'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _multiplyBySeven,
                  child: const Text('*7'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
