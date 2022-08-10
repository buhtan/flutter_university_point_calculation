import 'package:flutter/material.dart';
import 'package:not_utgulmasi/constans/app_constans.dart';

class ortalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const ortalamaGoster(
      {required this.dersSayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi ders Girildi" : "Ders Seçiniz",
          style: sabitler.ortalamaGosterBodyStyle,
        ),
        Text(
          ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: sabitler.ortalamaStyle,
        ),
        Text(
          "ortalama",
          style: sabitler.ortalamaGosterBodyStyle,
        )
      ],
    );
  }
}
