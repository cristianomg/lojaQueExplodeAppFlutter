
import 'dart:convert';

import 'package:app/models/authentication.dart';
import 'package:http/http.dart' as http;
class AuthService{
  static Future<Authentication> login(String email, String password)async{
    var url = 'http://07fafe782aab.ngrok.io/api/v1/Auth';
    var params = {"email": email, "password": password};
    print('aqui');
    print(params);
    print(url);
    var body = json.encode(params);
    var header = {'Content-Type': "application/json"};

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200){
      var result = json.decode(response.body);
      var authentication = Authentication.fromJson(result);
      return authentication;
    }
    
    return null;
  }
}