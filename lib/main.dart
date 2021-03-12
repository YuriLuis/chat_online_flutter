import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  runApp(MyApp());




  /**
   *
   * Para escrever os dados no banco de dados.
      em .document() se chamar o metodo sem passar o parametro ele cria o id
   * automaticamente do banco de dados.
   *
  Firestore.instance.collection('mensagens').document().collection('arquivos')
      .document().setData({
    'nome_arquivo' : "foto.jpg"
  });
   */
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
