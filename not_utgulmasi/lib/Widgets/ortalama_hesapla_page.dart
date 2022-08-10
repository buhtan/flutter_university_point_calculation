import 'dart:math';

import 'package:flutter/material.dart';
import 'package:not_utgulmasi/Widgets/ders_listesi.dart';
import 'package:not_utgulmasi/Widgets/ortalama_g%C3%B6ster_widget.dart';

import 'package:not_utgulmasi/constans/app_constans.dart';
import 'package:not_utgulmasi/helper/data_helper.dart';
import 'package:not_utgulmasi/model/ders.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  OrtalamaHesaplaApp({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaApp> createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            sabitler.Basliktext,
            style: sabitler.baslisStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ortalamaGoster(
                  dersSayisi: Datahelper.tumEklenenDersler.length,
                  ortalama: Datahelper.ortalamaHesapla(),
                ),
              )
            ],
          ),
          Expanded(
            child: Derslistesi(
              onElemanCikarildi: (index) {
                Datahelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: sabitler.yatayPadding8,
                  child: _buildHarfler(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: sabitler.yatayPadding8,
                  child: _buildKrediler(),
                ),
              ),
              IconButton(
                onPressed: _deresEkleVeOrtalmaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 2) {
          return "Ders Adını giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Ders giriniz",
          border: OutlineInputBorder(
              borderRadius: sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
          });
        },
        underline: Container(),
        items: Datahelper.tumDerslerinHarfleri(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            print(deger);
          });
        },
        underline: Container(),
        items: Datahelper.tumDerslerinKredileri(),
      ),
    );
  }

  void _deresEkleVeOrtalmaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenekDers = ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      Datahelper.dersEkle(eklenekDers);
      print(Datahelper.ortalamaHesapla());
      setState(() {});
    }
  }
}
