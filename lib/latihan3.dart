import 'package:flutter/material.dart';

class Latihan3 extends StatefulWidget {
  const Latihan3({super.key});

  @override
  State<Latihan3> createState() => _Latihan3State();
}

class _Latihan3State extends State<Latihan3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20), 
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth >= 1024) {
               
                return buildVerticalScrollableGrid([
                  [1, 2, 3, 4], 
                  [5, 6, 7], 
                  [8, 9, 10, 11], 
               ]);
              } else if (constraints.maxWidth >= 600) {
                
                return buildVerticalScrollableGrid([
                  [2, 4], 
                  [7], 
                  [8, 10, 11], 
                ]);
              } else {
                
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600,
                  ),
                  child: buildVerticalScrollableGrid([
                    [3], 
                    [5], 
                    [9], 
                  ]),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildVerticalScrollableGrid(List<List<int>> rows) {
    return SingleChildScrollView(
      child: Column(
        children: rows.map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((number) {
              return Expanded(child: buildBox(number));
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
  Widget buildBox(int number) {
    Color color = getColor(number);
    return Container(
      height: 200,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '$number',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Color getColor(int number) {
    switch (number) {
      case 1: return Colors.red;
      case 2: return Colors.blue;
      case 3: return Colors.yellow;
      case 4: return Colors.purple;
      case 5: return Colors.green;
      case 6: return Colors.black;
      case 7: return Colors.orange;
      case 8: return Colors.pink;
      case 9: return Colors.grey;
      case 10: return Colors.brown;
      case 11: return Colors.deepOrange;
      default: return Colors.white;
    }
  }
}
