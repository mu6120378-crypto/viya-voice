import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ViyaApp());
}

class ViyaApp extends StatelessWidget {
  const ViyaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final idCtrl = TextEditingController(text: 'user_123');
  final roomCtrl = TextEditingController(text: 'viya-room-1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.graphic_eq, size: 80, color: Colors.purpleAccent),
            Text('VIYA VOICE', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text('Voice Only', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 40),
            TextField(controller: idCtrl, decoration: InputDecoration(labelText: 'Your Name', border: OutlineInputBorder())),
            SizedBox(height: 15),
            TextField(controller: roomCtrl, decoration: InputDecoration(labelText: 'Room ID', border: OutlineInputBorder())),
            SizedBox(height: 25),
            SizedBox(width: double.infinity, height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>CallScreen(callID: roomCtrl.text, userID: idCtrl.text, userName: idCtrl.text)));
                },
                child: Text('JOIN VOICE', style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CallScreen extends StatelessWidget {
  final String callID, userID, userName;
  const CallScreen({required this.callID, required this.userID, required this.userName, super.key});
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1159793434,
      appSign: '5b7b9df3a2c7c9b7c6d1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d3',
      userID: userID,
      userName: userName,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
        ..turnOnCameraWhenJoining = false
        ..turnOnMicrophoneWhenJoining = true
        ..useSpeakerWhenJoining = true,
    );
  }
}
