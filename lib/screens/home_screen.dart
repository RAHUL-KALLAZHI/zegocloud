import 'package:flutter/material.dart';
import 'call_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  final String userId;
  const HomeScreen({super.key, required this.userName, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) =>
                    CallScreen(userName: userName, userId: userId)));
          },
          color: Colors.purple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          textColor: Colors.white,
          child: const Text("Start Call"),
        ),
      ),
    );
  }
}
