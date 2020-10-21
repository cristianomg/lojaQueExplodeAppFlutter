class LoginController{

  Future<bool> validarAcesso(String email, String password) async{
    if (email != null && password != null){
      print(email);
      print(password);
      return true;
    }
    print(email);
    print(password);
    return false;
  }
}