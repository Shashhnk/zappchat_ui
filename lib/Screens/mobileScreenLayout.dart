import 'package:flutter/material.dart';
import 'package:zappchat_ui/constants.dart';
import 'package:zappchat_ui/widgets/contacts_list.dart';

class mobileScreenLayout extends StatelessWidget {
  const mobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appBarColor,
            title: const Text(
              'ZappChat',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
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
                  Tab(text: 'STATUS'),
                  Tab(text: 'CALLS'),
                ]),
          ),
          body: ContactsLists(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: tabColor,
            child: const Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
        ));
  }
}
