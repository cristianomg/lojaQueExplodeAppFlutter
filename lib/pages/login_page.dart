import 'package:app/services/AuthService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void validarAcesso(BuildContext context) async {
    String email = this.email.text;
    String password = this.password.text;

    var authentication = await AuthService.login(email, password);
    if (authentication != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', authentication.token);
      prefs.setString('userId', authentication.user.id);
      prefs.setString('permission', authentication.permission);
      Navigator.pushNamed(context, "/bottomNavigation");
    } else {
      alert(context, "Login", "Email e/ou senha invalidos.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  width: 128,
                  height: 128,
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    hintText: "Digite o email",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      child: Text("Recuperar senha",
                          style: TextStyle(color: Colors.red)),
                      onPressed: null),
                ),
                FlatButton(
                    color: Colors.blue,
                    child:
                        Text("Entrar", style: TextStyle(color: Colors.white)),
                    onPressed: () => validarAcesso(context)),
                FlatButton(
                    color: Colors.red,
                    child: Text("Criar Conta",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/criarConta')),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}
