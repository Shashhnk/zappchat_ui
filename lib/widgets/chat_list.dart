import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zappchat_ui/services/Database_services.dart';
import 'package:zappchat_ui/widgets/MyMessageCard.dart';
import 'package:zappchat_ui/widgets/SenderMessageCard.dart';

const Duration offset = Duration(hours: 5, minutes: 30);

class ChatList extends StatelessWidget {
  final String userTo;
  const ChatList({super.key, required this.userTo});

  @override
  Widget build(BuildContext context) {
    final DataBase_service database = DataBase_service();
    return StreamBuilder(
      stream: database.getMessages(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemBuilder: (context, index) {
                    final messagea = messages?[index];
                    if (messagea.userTo == userTo &&
                        messagea.userFrom == database.getCurrentUserId()) {
                      final message = messagea;

                      return MyMessageCard(
                        message: message,
                        date: (DateFormat.Hm().format(
                          message.createAt.add(offset),
                        )),
                      );
                    }
                    if (messagea.userTo == database.getCurrentUserId() &&
                        messagea.userFrom == userTo) {
                      final message = messagea;

                      return SenderMessageCard(
                          message: message,
                          date: (DateFormat.Hm().format(
                            message.createAt.add(offset),
                          )));
                    } else {
                      return null;
                    }
                  },
                  itemCount: messages?.length,
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
