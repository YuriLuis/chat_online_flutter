import 'package:chat_online_flutter/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main()async{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat online Flutter ',
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        primarySwatch: Colors.blue
      ),
      home: ChatScreen(),
    );
  }
}
