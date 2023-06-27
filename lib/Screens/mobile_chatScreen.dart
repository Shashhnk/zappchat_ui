import 'package:flutter/material.dart';
import 'package:zappchat_ui/info.dart';
import 'package:zappchat_ui/constants.dart';
import 'package:zappchat_ui/widgets/chat_list.dart';

class mobileChatScreen extends StatelessWidget {
  const mobileChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(info[0]['name'].toString()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          //ChatList
          const Expanded(child: ChatList()),
          TextField(
            decoration: InputDecoration(
              fillColor: mobileChatBoxColor,
              filled: true,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.money,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              hintText: 'Type a Message',
              border: OutlineInputBorder(


                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
