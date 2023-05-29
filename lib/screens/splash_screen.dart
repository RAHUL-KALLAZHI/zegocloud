import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zego_cloud/screens/home_screen.dart';
import 'package:zego_cloud/screens/signup_screen.dart';

import '../utils/shared_preference.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      final status =
          await SharedPrefrenceUtils.instance.getSignedInStatus('isSignedIN');
      final userData = await SharedPrefrenceUtils.instance.getUserData();
      status
          ? Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(
                  userName: userData[0] ?? '', userId: userData[1] ?? '')))
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SignupScreen()));
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(),
            SizedBox(height: 15),
            LoaderWidget(),
          ],
        ),
      ),
    );
  }
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitChasingDots(
      color: Color.fromRGBO(156, 39, 176, 1),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Zego Cloud",
      style: TextStyle(
        color: Colors.purple,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
      ),
    );
  }
}
