import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  Function({String text , File imgFile}) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final TextEditingController _controller = TextEditingController();

  bool _isComposer = false;

  void _reset(){
    _controller.clear();
    setState(() {
      _isComposer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              // ignore: deprecated_member_use
              final File imgFile  = await ImagePicker.pickImage(source: ImageSource.camera);
              if(imgFile == null){
                return;
              }
              widget.sendMessage(imgFile : imgFile);
            },
          ),
          Expanded(
              child: TextField(
            controller: _controller,
            decoration:
                InputDecoration.collapsed(hintText: "Digite a mensagem!"),
            onChanged: (text) {
              setState(() {
                _isComposer = text.isNotEmpty;
              });
            },
            onSubmitted: (text) {
              widget.sendMessage(text: text); // Printa
              _reset();
            },
          )),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: _isComposer
                  ? () {
                      widget.sendMessage(text: _controller.text);
                      _reset();
                    }
                  : null)
        ],
      ),
    );
  }
}
