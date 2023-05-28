import 'package:flutter/material.dart';
import 'package:zego_cloud/utils/global_key.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'screens/splash_screen.dart';
import 'utils/shared_preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceUtils.instance.initialize();
  ZegoUIKitPrebuiltCallInvitationService()
      .setNavigatorKey(GlobalKeyUtils.navigatorKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalKeyUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const SpalshScreen(),
    );
  }
}
