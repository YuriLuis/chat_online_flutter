import 'dart:io';

import 'package:chat_online_flutter/view/text_composer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  Map<String, dynamic> data = {};

  void _sendMessage({String text, File imgFile}) async{
    if(imgFile != null){
      StorageUploadTask task = FirebaseStorage.instance.ref().child(
        DateTime.now().microsecondsSinceEpoch.toString()
      ).putFile(imgFile);

      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      data['imgUrl'] = url;
    }
    if(text != null){
      data['text'] = text;
    }
    Firestore.instance.collection("messages").add(data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá"),
        elevation: 0,
      ),
      body: TextComposer(
          _sendMessage //chama metodo que grava no banco.
      ),
    );
  }
}
