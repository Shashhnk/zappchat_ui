import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Modal/Message.dart';

class DataBase_service extends ChangeNotifier {
  final SupabaseClient client = Supabase.instance.client;

  Future<void> update_name_phone(
      {required String name, required String phone}) async {
    await client.auth
        .updateUser(UserAttributes(phone: phone, data: {'name': name}));
    await client
        .from('contact')
        .insert({'id': client.auth.currentUser?.id, 'username': name});
  }

  bool check_phone({required String phone}) {
    return client.auth.currentUser?.phone == phone.substring(1) ? true : false;
  }

  Stream getMessages() {
    return client
        .from('message')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => maps
            .map((item) => Message.fromJson(item, getCurrentUserId()))
            .toList());
  }

  Future<void> saveMessage(
      {required String content, required String userTo}) async {
    final message = Message.create(
        content: content, userFrom: getCurrentUserId(), userTo: userTo);

    await client.from('message').insert(message.toMap());
  }

  Future<void> markAsRead(String messageId) async {
    await client
        .from('message')
        .update({'mark_as_read': true}).eq('id', messageId);
  }

  Stream all_username(String id) {
    return client.from('contact').stream(primaryKey: ['id']).neq('id', id);
  }

  Future<void> addvoicecalldetails(
      {required int duration,
      required String user_from,
      required String user_to}) async {
    await client.from('voicecall').insert(
        {'duration': duration, 'user_from': user_from, 'user_to': user_to});
  }

  bool isAuthentificated() => client.auth.currentUser != null;

  String getCurrentUserId() =>
      isAuthentificated() ? client.auth.currentUser!.id : '';
}
