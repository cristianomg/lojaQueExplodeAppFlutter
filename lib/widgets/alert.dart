import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String msg){
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        title: Text("Login"),
        content: Text(msg),
        actions:  <Widget> [
          FlatButton(onPressed: ()=>Navigator.pop(context), child: Text("Ok"))
        ],
      );
    }
  );
}