import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient client = Supabase.instance.client;

  Future<void> signUpUsingEmailPassword(
      {required String email, required String password}) async {
    try {
      await client.auth.signUp(password: password, email: email);
    } catch (e) {
      print(e);
    }
  }

  bool isSignedIn() {
    return client.auth.currentUser != null ? true : false;
  }

   Future<void> Signout() async {
    await client.auth.signOut();
  }

  Future<void> loginUsingEmailPassword(
      {required String password, required String email}) async {
    try {
      await client.auth.signInWithPassword(password: password, email: email);
    } catch (e) {
      print(e);
    }
  }
}
