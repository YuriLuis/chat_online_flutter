import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

  Function(String) sendMessage;

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
            onPressed: () {},
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
              widget.sendMessage(text); // Printa
              _reset();
            },
          )),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: _isComposer
                  ? () {
                      widget.sendMessage(_controller.text);
                      _reset();
                    }
                  : null)
        ],
      ),
    );
  }
}
