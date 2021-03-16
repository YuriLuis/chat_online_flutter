import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  //Construtor
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [

          !mine ?
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data[
                  'senderPhotoUrl']), //Tem que ser igual a linha 69 do arquivo chat_screen.dart
            ),
          ) : Container(),
          Expanded(
              child: Column(
            crossAxisAlignment:  mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              data['imgUrl'] != null
                  ? Image.network(
                      data['imgUrl'],
                      width: 250,
                    )
                  : Text(
                      data['text'],
                      textAlign: mine ? TextAlign.end : TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
              Text(
                data['senderName'],
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ), //Tem que ser igual a linha 68 do arquivo chat_screen.dart
            ],
          )),
          mine ?
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data[
              'senderPhotoUrl']), //Tem que ser igual a linha 69 do arquivo chat_screen.dart
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
