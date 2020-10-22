import 'package:app/pages/bottom_navegation.dart';
import 'package:app/pages/cadastrar_produto.dart';
import 'package:app/pages/criar_conta.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/recuperar_senha.dart';
import 'package:app/pages/home_page.dart';

import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Loja que explode",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor : Colors.blue
       ),
      initialRoute: '/' ,
      routes: {
        '/': (context)=>LoginPage(),
        '/bottomNavigation': (context)=>BottonNavigation(),
        '/homePage': (context)=>HomePage(),
        '/criarConta': (context)=>CriarConta(),
        '/recuperarSenha': (context)=>RecuperarSenha(),
        '/cadastrarProduto': (context)=>CadastrarProduto(),
      }
     );
  }
}