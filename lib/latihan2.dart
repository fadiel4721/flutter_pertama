import 'package:flutter/material.dart';

class Latihan2 extends StatefulWidget {
  const Latihan2({super.key});

  @override
  State<Latihan2> createState() => _Latihan2State();
}

class _Latihan2State extends State<Latihan2> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: const EdgeInsets.all(70),
        child: screenWidth > 600
            ? Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: const Column(
                        children: [],
                      ),
                    ),
                  ),
          
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://tse2.mm.bing.net/th?id=OIP.8SDJnFxCBg9_DLbrn1S6pQHaEK&pid=Api&P=0&h=180',
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Sign in',
                            style: TextStyle(color: Colors.blue, fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://tse2.mm.bing.net/th?id=OIP.8SDJnFxCBg9_DLbrn1S6pQHaEK&pid=Api&P=0&h=180',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.blue, fontSize: 24),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
