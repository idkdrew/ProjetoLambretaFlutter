// controllers/login_controller.dart
import '../model/user_model.dart';

class LoginController {
  User? user;

  void login(String login, String password) {
    user = User(login: login, password: password);

    // Aqui podemos fazer validações básicas (sem banco de dados)
    if (user!.login == "admin" && user!.password == "1234") {
      print("Login bem-sucedido!");
    } else {
      print("Login ou senha incorretos.");
    }
  }
}
