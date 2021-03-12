import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main()async{
  runApp(MyApp());

  QuerySnapshot snapshot = await Firestore.instance.collection('mensagens').getDocuments();
  snapshot.documents.forEach((d) {
    print(d.data);
  });
  /**
   *
   * Para escrever os dados no banco de dados.
      em .document() se chamar o metodo sem passar o parametro ele cria o id
   * automaticamente do banco de dados.
   *
  Firestore.instance.collection('mensagens').document().collection('arquivos')
      .document().setData({
    'from' : 'Yuri',
      'texto' : 'Tudo Bem?'
  });
   */
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
