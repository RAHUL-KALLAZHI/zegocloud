import 'package:flutter/material.dart';
import 'package:zego_cloud/utils/zego_config.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'call_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  final String userId;
  const HomeScreen({super.key, required this.userName, required this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    onUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JoinCallButton(widget: widget),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                      )),
                  IconButton(
                    onPressed: iniviteCall,
                    icon: const Icon(Icons.call_outlined),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void iniviteCall() {
    ZegoSendCallInvitationButton(
      invitees: [ZegoUIKitUser(id: controller.text, name: "name")],
      isVideoCall: true,
      resourceID: "resource_id_with_voip_datamessages",
    );
  }

  void onUserLogin() {
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: ZegoConfig.appId /*input your AppID*/,
      appSign: ZegoConfig.appSignIn /*input your AppSign*/,
      userID: widget.userId,
      userName: widget.userName,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }
}

class JoinCallButton extends StatelessWidget {
  const JoinCallButton({
    super.key,
    required this.widget,
  });

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) =>
                CallScreen(userName: widget.userName, userId: widget.userId)));
      },
      color: Colors.purple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textColor: Colors.white,
      child: const Text("Start Call"),
    );
  }
}
