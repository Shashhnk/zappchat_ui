import 'package:flutter/material.dart';

import 'package:zappchat_ui/info.dart';
import 'package:zappchat_ui/widgets/MyMessageCard.dart';
import 'package:zappchat_ui/widgets/SenderMessageCard.dart';
class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context,index){
        if(messages[index]['isMe']==true){
          //MyMessageCard
          return MyMessageCard(Message: messages[index]['text'].toString(), date: messages[index]['time'].toString(),);
        }else{
          return SenderMessageCard(Message: messages[index]['text'].toString(), date: messages[index]['time'].toString(),);
          //SenderMessageCard
        }

      },
    );
  }
}
