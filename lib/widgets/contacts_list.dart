import 'package:flutter/material.dart';
import 'package:zappchat_ui/Screens/mobile_chatScreen.dart';
import 'package:zappchat_ui/constants.dart';
import 'package:zappchat_ui/services/Database_services.dart';
class ContactsLists extends StatelessWidget {
  const ContactsLists({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DataBase_service()
          .all_username(DataBase_service().getCurrentUserId()),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          final user_name = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: user_name?.length,
                      itemBuilder: (context, index) {
                        final user_nam = user_name?[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => mobileChatScreen(
                                    name: user_nam['username'],
                                    userTo: '${user_nam['id']}')));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: appBarColor,
                                child: Text(
                                  '${user_nam['username']}'.substring(0, 1),
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              title: Text('${user_nam['username']}',
                                  style: const TextStyle(fontSize: 20)),
                            ),
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
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
