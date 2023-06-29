import 'package:flutter/material.dart';
import 'package:zappchat_ui/Screens/Sign_out_screen.dart';
import 'package:zappchat_ui/constants.dart';
import 'package:zappchat_ui/widgets/contacts_list.dart';
import 'package:zappchat_ui/services/Database_services.dart';

class mobileScreenLayout extends StatelessWidget {
  mobileScreenLayout({super.key});
  final k = DataBase_service().client.auth.currentUser!.userMetadata;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appBarColor,
            title: Text(
              k != null ? '${k?['name']}' : 'ZappChat',
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const signOut()));
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ),
            ],
            bottom: const TabBar(
                indicatorWeight: 3,
                labelColor: tabColor,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                indicatorColor: tabColor,
                tabs: [
                  Tab(text: 'CHATS'),
                ]),
          ),
          body: const ContactsLists(),
        ));
  }
}
