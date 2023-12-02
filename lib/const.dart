import 'package:flutter/material.dart';

class ConstantViews{

  showsnackBar(context,text){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
     content: Text("$text"),
      ));
  }
}