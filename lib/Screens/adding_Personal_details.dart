import 'package:flutter/material.dart';
import 'package:zappchat_ui/Screens/mobileScreenLayout.dart';
import 'package:zappchat_ui/services/Database_services.dart';
import '../constants.dart';

class personalDetailsScreen extends StatelessWidget {
  final TextEditingController ncon = TextEditingController();
  final TextEditingController pcon = TextEditingController();
  final DataBase_service dataBase_service = DataBase_service();
  personalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              const Text(
                'Enter Your Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: ncon,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      fillColor: mobileChatBoxColor,
                      filled: true),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Enter Your Number with Country Code',
                style: TextStyle(color: Colors.white70),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: pcon,
                  decoration: const InputDecoration(
                      labelText: 'Mobile No.',
                      border: OutlineInputBorder(),
                      fillColor: mobileChatBoxColor,
                      filled: true),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  await dataBase_service.update_name_phone(
                      name: ncon.text, phone: pcon.text);
                  if (dataBase_service.check_phone(phone: pcon.text)) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => mobileScreenLayout()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Successfully Stored Details',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: mobileChatBoxColor,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Error Storing Details',
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
                    'Finish',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
