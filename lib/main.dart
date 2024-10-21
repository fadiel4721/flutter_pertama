import 'package:flutter/material.dart';

import 'homepage.dart';


void main() {
  runApp(const MyApp());
  executeLogic(); // Panggil fungsi untuk menjalankan logika non-Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



void pertemuan1() {

  dynamic a = 100.1;
  a = 'Fadiel Muhammad';

  print(a);


  for (int i = 0; i < 10; i++) {

    print('pertemuan ${i + 1}');
  }

  var mahasiswa = 'Teknologi Informasi';

  if (mahasiswa.isNotEmpty) {
    print('Mahasiswa politeknik takumi');
  } else {
    print('Bukan Mahasiswa Politeknik Takumi');
  }
}

void pertemuan2() {
  String bulanini = 'oktober';
  print(bulanini);
  cekBulanGanjilGenap(bulanini);
}

void cekBulanGanjilGenap(String bulan) {
  
  List<String> bulanGenap = [
    'februari',
    'april',
    'juni',
    'agustus',
    'oktober',
    'desember'
  ];
  List<String> bulanGanjil = [
    'januari',
    'maret',
    'mei',
    'juli',
    'september',
    'november'
  ];

 
  if (bulanGenap.contains(bulan.toLowerCase())) {
    print('$bulan adalah bulan genap');
  } else if (bulanGanjil.contains(bulan.toLowerCase())) {
    print('$bulan adalah bulan ganjil');
  } else {
    print('Bulan tidak valid');
  }

  
}


void executeLogic() {
  pertemuan1();
  pertemuan2();
}
