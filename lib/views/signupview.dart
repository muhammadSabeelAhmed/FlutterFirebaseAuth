import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_integration/const.dart';
import 'package:flutter_firebase_integration/utils/collections.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
        TextEditingController nameController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController phonenUmberController = TextEditingController();

    ConstantViews constants = ConstantViews();


    addUserData() async {
      var product = FirebaseFirestore.instance.collection(MyCollections.users);
      await product.add({
        "email":emailController.text,
        "password":passwordController.text,
        "name":nameController.text,
        "country":countryController.text,
        "phone":phonenUmberController.text
      })
      .then((value){
        emailController.text="";
        passwordController.text="";
        nameController.text="";
        countryController.text="";
        phonenUmberController.text="";
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Created successfully")));
      })
      .catchError((value)=>print("Error in add products: "+value));
      
    }

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
              addUserData();
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
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter full name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: countryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter country',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: phonenUmberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter phone number',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter password',
              ),
            ),
            SizedBox(
              height: 20,
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
