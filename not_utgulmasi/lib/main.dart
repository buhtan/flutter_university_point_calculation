import 'package:flutter/material.dart';
import 'package:not_utgulmasi/Widgets/ortalama_hesapla_page.dart';
import 'package:not_utgulmasi/constans/app_constans.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Dinamik oralama Hesapla",
      theme: ThemeData(
        primarySwatch: sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: OrtalamaHesaplaApp(),
    );
  }
}