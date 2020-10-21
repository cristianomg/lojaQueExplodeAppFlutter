import 'package:flutter/material.dart';

class RecuperarSenha extends StatelessWidget {
  const RecuperarSenha({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: [
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue
                ),
              child: FlatButton(
                onPressed: null,
                child: Text("Recuperar", style: TextStyle(color: Colors.white)))
            ),
        ],),
      ),
    );
  }
}