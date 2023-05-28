import 'package:flutter/material.dart';

import '../utils/shared_preference.dart';
import '../utils/global_key.dart';
import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<FormState> _key = GlobalKey<FormState>();
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController numbercontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
            key: GlobalKeyUtils.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NameTextInput(namecontroller: namecontroller),
                  numberTextInput(numbercontroller: numbercontroller),
                  SignupButton(number: numbercontroller, name: namecontroller),
                ],
              ),
            )),
      ),
    );
  }
}

class numberTextInput extends StatelessWidget {
  const numberTextInput({
    super.key,
    required this.numbercontroller,
  });

  final TextEditingController numbercontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: numbercontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter mobile number';
          } else if (value.length < 10) {
            return 'Please Enter valid Mobile';
          } else if (value.length > 10) {
            return 'Please Enter valid Mobile';
          }
        },
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            hintText: "Phone",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            labelText: "Phone"),
      ),
    );
  }
}

class NameTextInput extends StatelessWidget {
  const NameTextInput({
    super.key,
    required this.namecontroller,
  });

  final TextEditingController namecontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: namecontroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter Name';
          }
        },
        decoration: const InputDecoration(
            hintText: "Name",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            labelText: "Name"),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  final TextEditingController number;
  final TextEditingController name;
  const SignupButton({super.key, required this.number, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.purple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textColor: Colors.white,
      onPressed: () async {
        if (GlobalKeyUtils.formKey.currentState!.validate()) {
          final userData = [name.text, number.text];
          await SharedPrefrenceUtils.instance.setUserData(userData);
          SharedPrefrenceUtils.instance.setSignedInStatus().then((value) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(
                      userId: number.text,
                      userName: name.text,
                    )));
          });
        }
      },
      child: const Text("SignUp"),
    );
  }
}

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "ZegoCloud",
      style: TextStyle(
        letterSpacing: 2,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
