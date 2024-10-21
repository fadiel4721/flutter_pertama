import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_pertama/homepage_dana.dart';
import 'package:flutter_pertama/homepage_pulsa.dart';
import 'package:flutter_pertama/homepage_shoope.dart';
import 'package:flutter_pertama/latihan2.dart';
import 'package:flutter_pertama/latihan3.dart';
import 'package:flutter_pertama/latihanpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              onPageChanged: (value) {},
              autoPlayInterval: 3000,
              isLoop: true,
              children: [
                Image.network(
                  'https://tse1.mm.bing.net/th?id=OIP.tJeVrHR-89PfrljxtDyTVAHaDH&pid=Api&P=0&h=180',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://tse2.mm.bing.net/th?id=OIP.NKoxyBdXGHPczO5gIT0YogHaEK&pid=Api&P=0&h=180',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://tse2.mm.bing.net/th?id=OIP.8SDJnFxCBg9_DLbrn1S6pQHaEK&pid=Api&P=0&h=180',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Creating a 3-button row
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LatihanPage()));
                          },
                          child: const Text('Latihan Page 1'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Latihan2()));
                          },
                          child: const Text('Latihan Page 2'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Latihan3()));
                          },
                          child: const Text('Latihan Page 3'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Buttons below the row
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Homepagedana()));
                    },
                    child: const Text('Homepage Dana'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomepageShoope()));
                    },
                    child: const Text('Homepage Shoope'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomepagePulsa()));
                    },
                    child: const Text('Homepage Pulsa'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
