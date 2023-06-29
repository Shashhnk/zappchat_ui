import 'package:flutter/material.dart';
import 'package:zappchat_ui/constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zappchat_ui/services/Database_services.dart';

class VoiceCallScreen extends StatelessWidget {
  final String name;
  final String user_to;
  VoiceCallScreen({super.key, required this.name, required this.user_to});
  final TextEditingController ccon = TextEditingController();

  final DataBase_service database = DataBase_service();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text('Call Screen'),
        backgroundColor: appBarColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Call ID should be same for both users',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Enter Call ID at same time',
                style: TextStyle(color: Colors.white70),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: ccon,
                  decoration: const InputDecoration(
                      labelText: 'Call ID',
                      border: OutlineInputBorder(),
                      fillColor: mobileChatBoxColor,
                      filled: true),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (ccon.text.isNotEmpty) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => callScreen(
                                  callID: ccon.text,
                                  name: name, user_to: user_to,
                                )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Call ID cannot be empty',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: mobileChatBoxColor,
                      ),
                    );
                  }
                },
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: mobileChatBoxColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Enter',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class callScreen extends StatelessWidget {
  final String callID;
  final String name;
  final String user_to;

  final DataBase_service database = DataBase_service();
  callScreen({
    super.key,
    required this.callID,
    required this.name, required this.user_to,
  });

  @override
  Widget build(BuildContext context) {
    int callDuration = 0;
    return ZegoUIKitPrebuiltCall(
      appID: 56458687,
      appSign:
          'e223ec822a7b6d32c0d7490cbce099f51c5cc9609057bcecc169ffb93e330eed',
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
        ..durationConfig.onDurationUpdate = (Duration duration) {
          callDuration++;
        }
        ..onHangUp = () async{
          final roundedMinutes = (callDuration / 60).ceil();
          await database.addvoicecalldetails(duration: roundedMinutes, user_from: database.client.auth.currentUser!.id, user_to: user_to);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => callendScreen(
                        name: name,
                        callDuration: roundedMinutes,
                      )));
        },
      userID: database.client.auth.currentUser!.id,
      userName: database.client.auth.currentUser!.userMetadata?['name'],
    );
  }
}

class callendScreen extends StatelessWidget {
  final String name;
  final int callDuration;
  const callendScreen(
      {super.key, required this.name, required this.callDuration});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: appBarColor,
              child: Text(
                name.substring(0, 1),
                style: const TextStyle(fontSize: 50),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Duration of Call was $callDuration minutes',
                style: const TextStyle(fontSize: 18, color: textColor)),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 80,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: mobileChatBoxColor,
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  'OK',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
