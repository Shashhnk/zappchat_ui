import 'package:flutter/material.dart';
import 'package:zappchat_ui/services/auth_services.dart';
import '../constants.dart';
import 'login_screen.dart';

class signOut extends StatelessWidget {
  const signOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogOut Page'),
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 70,
          decoration: BoxDecoration(
              color: appBarColor, borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {
              AuthService().Signout();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => loginScreen()));

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Successfully Logged Out',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: mobileChatBoxColor,
                ),
              );
            },
            child: const Text(
              'LogOut',
              style: TextStyle(fontSize: 25, color: Colors.lightBlueAccent),
            ),
          ),
        ),
      ),
    );
  }
}
