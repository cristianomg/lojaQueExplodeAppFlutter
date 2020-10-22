
import 'dart:convert';
import 'package:http/http.dart' as http;
class UserService{
  static Future<String> createUser(String name, String email, String password, String checkPassword, String phone)async{
    var url = 'http://a07c596e34a0.ngrok.io/api/v1/User';
    var params = {
      "name": name,
      "password": password,
      "checkedPassword": checkPassword,
      "email": email,
      "phone": phone
    };
    var body = json.encode(params);
    var header = {'Content-Type': "application/json"};

    print(body);
    var response = await http.post(url, headers: header, body: body);
    
    print(response.statusCode);
    if (response.statusCode == 201){
      return "";
    }
    return "Ocorreu um erro interno tente novamente.";
  }
}