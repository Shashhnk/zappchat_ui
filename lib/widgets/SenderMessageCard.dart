import 'package:flutter/material.dart';
import 'package:zappchat_ui/Modal/Message.dart';
import 'package:zappchat_ui/widgets/mark_as_read.dart';
import '../constants.dart';

class SenderMessageCard extends StatelessWidget {
  final Message message;
  final String date;
  const SenderMessageCard(
      {super.key, required this.message, required this.date});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45, minWidth: 100),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: senderMessageColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 30, top: 5, bottom: 20),
                child: Text(
                  message.content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      date,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    MarkAsRead(message: message)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
