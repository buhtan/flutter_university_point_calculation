import 'package:flutter/material.dart';
import 'package:not_utgulmasi/constans/app_constans.dart';
import 'package:not_utgulmasi/helper/data_helper.dart';
import 'package:not_utgulmasi/model/ders.dart';

class Derslistesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const Derslistesi({required this.onElemanCikarildi, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ders> tumDersler = Datahelper.tumEklenenDersler;

    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                      child: ListTile(
                    title: Text(tumDersler[index].ad),
                    leading: CircleAvatar(
                      backgroundColor: sabitler.anaRenk,
                      child: Text(
                        (tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0),
                      ),
                    ),
                    subtitle: Text(
                        "${tumDersler[index].krediDegeri} Kredi,   Not Değeri ${tumDersler[index].harfDegeri}"),
                  )),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                "Lütfen ders ekleyiniz",
                style: sabitler.baslisStyle,
              ),
            ),
          );
  }
}
