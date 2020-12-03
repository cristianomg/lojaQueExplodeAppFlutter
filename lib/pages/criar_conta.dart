import 'package:app/services/UserService.dart';
import 'package:app/widgets/alert.dart';
import 'package:flutter/material.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({Key key}) : super(key: key);

  @override
  _CriarContaState createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final checkPassword = TextEditingController();
  final phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void criarUsuario(BuildContext context) async {
    String name = this.name.text;
    String email = this.email.text;
    String password = this.password.text;
    String checkPassword = this.checkPassword.text;
    String phone = this.phone.text;
    var resultCreateUser = await UserService.createUser(
        name, email, password, checkPassword, phone);

    if (resultCreateUser == "") {
      alert(context, "Cadastro", "Usuário criado");
      Navigator.pushNamed(context, "/");
    } else {
      alert(context, "Cadastro", resultCreateUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de usuário"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "nome",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: email,
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
              TextFormField(
                controller: checkPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirme sua senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Telefone",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  color: Colors.blue,
                  child: Text("Criar", style: TextStyle(color: Colors.white)),
                  onPressed: () => criarUsuario(context))
            ],
          ),
        ),
      ),
    );
  }
}
