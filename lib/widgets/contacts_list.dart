import 'package:flutter/material.dart';
import 'package:zappchat_ui/Screens/mobile_chatScreen.dart';
import 'package:zappchat_ui/constants.dart';
import 'package:zappchat_ui/info.dart';

class ContactsLists extends StatelessWidget {
  const ContactsLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return InkWell(

                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => mobileChatScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                info[index]['profilePic'].toString()),
                          ),
                          title: Text(info[index]['name'].toString(),
                              style: const TextStyle(fontSize: 18)),
                          subtitle: Text(
                            info[index]['message'].toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          ),
                          trailing: Text(
                            info[index]['time'].toString(),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          )),
                    ),
                  );
                }),
          ),
          const Divider(
            color: dividerColor,
            indent: 85,
          )
        ],
      ),
    );
  }
}
