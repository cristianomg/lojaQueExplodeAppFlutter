
import 'dart:convert';

import 'package:app/models/authentication.dart';
import 'package:http/http.dart' as http;
class AuthService{
  static Future<Authentication> login(String email, String password)async{
    var url = 'http://macoratti.net.br/catalogo/api/contas/login';
    var params = {'username': 'macoratti@yahoo.com', 'senha': 'Hw8vup5e@2019', 'email': 'macoratti@yahoo.com'};

    var body = json.encode(params);
    var header = {'Content-Type': "application/json"};

    var response = await http.post(url, headers: header, body: body);

    var result = json.decode(response.body);

    var authentication = Authentication.fromJson(result);
    print(authentication.token);

    if (response.statusCode == 200)
      return authentication;
    
    return null;
  }
}