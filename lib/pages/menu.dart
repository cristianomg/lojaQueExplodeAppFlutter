import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

_logout(context)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  return Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
                  );
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: ListView(
        children: [
          FlatButton(
            color: Colors.blue,
            child: Text("Cadastrar produto", style: TextStyle(color: Colors.white)),
            onPressed: ()=>Navigator.pushNamed(context, '/cadastrarProduto')),
          SizedBox(
            height: 20,
          ),         
          FlatButton(
            color: Colors.red,
            child: Text("Atualizar produto", style: TextStyle(color: Colors.white)),
            onPressed: ()=>Navigator.pushNamed(context, '/criarConta')),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            color: Colors.green,
            child: Text("Cadastrar categoria", style: TextStyle(color: Colors.white)),
            onPressed: ()=>Navigator.pushNamed(context, '/createCategory')),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            color: Colors.brown,
            child: Text("Atualizar categoria", style: TextStyle(color: Colors.white)),
            onPressed: ()=>Navigator.pushNamed(context, '/criarConta')),
          SizedBox(
            height: 20,
          ),          
          FlatButton(
            color: Colors.red,
            child: Text("Logout", style: TextStyle(color: Colors.white)),
            onPressed: ()=>_logout(context)),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}