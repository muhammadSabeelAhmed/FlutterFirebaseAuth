import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home",style: TextStyle(fontSize: 50,color: Colors.green),),
    );
  }
}