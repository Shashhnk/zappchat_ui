import 'package:flutter/material.dart';
import 'package:zappchat_ui/Screens/VoiceCallScreen.dart';
import 'package:zappchat_ui/constants.dart';
import 'package:zappchat_ui/widgets/chat_list.dart';
import 'package:zappchat_ui/services/Database_services.dart';

class mobileChatScreen extends StatelessWidget {
  final String name;
  final String userTo;
  mobileChatScreen({super.key, required this.name, required this.userTo});

  final TextEditingController scon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(name),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VoiceCallScreen(name : name, user_to: userTo,)));
            },
            icon: const Icon(Icons.call),
          ),
        ],
      ),
      body: Column(
        children: [
          //ChatList
          Expanded(child: ChatList(userTo: userTo)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: scon,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      if (scon.text.isNotEmpty) {
                        await DataBase_service()
                            .saveMessage(content: scon.text, userTo: userTo);
                        scon.clear();
                      }
                    },
                  ),
                  hintText: 'Type Your Message',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                  fillColor: mobileChatBoxColor,
                  filled: true),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
