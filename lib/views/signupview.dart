import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_integration/const.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    ConstantViews constants = ConstantViews();

    signup() async {
      try {
        if (!emailController.text.contains("@") ||
            !emailController.text.contains(".")) {
          constants.showsnackBar(context, "Email is incorrect");
        } else if (passwordController.text.length < 6) {
          constants.showsnackBar(
              context, "Password length should be greater then or equal to 6");
        } else {
          FirebaseAuth auth = FirebaseAuth.instance;
          UserCredential credential = await auth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter email address',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  signup();
                },
                child: Text("Signup"))
          ],
        ),
      ),
    );
  }
}
