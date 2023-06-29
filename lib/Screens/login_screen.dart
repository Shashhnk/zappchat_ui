import 'package:flutter/material.dart';
import 'package:zappchat_ui/Screens/Registration_screen.dart';
import 'package:zappchat_ui/Screens/mobileScreenLayout.dart';
import 'package:zappchat_ui/constants.dart';
import 'package:zappchat_ui/services/auth_services.dart';
class loginScreen extends StatelessWidget {
  final TextEditingController econ = TextEditingController();
  final TextEditingController pcon = TextEditingController();
  final AuthService auth_service = AuthService();

  loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                'ZappChat',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome Back! You have been missed',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: econ,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      fillColor: mobileChatBoxColor,
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: pcon,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      fillColor: mobileChatBoxColor,
                      filled: true),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () async {
                  await auth_service.loginUsingEmailPassword(
                      email: econ.text, password: pcon.text);
                  if (auth_service.isSignedIn()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => mobileScreenLayout()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Successfully Logged In',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: mobileChatBoxColor,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Error while logging In',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: mobileChatBoxColor,
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: mobileChatBoxColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Login ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a Member?',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => registrationScreen()));
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
