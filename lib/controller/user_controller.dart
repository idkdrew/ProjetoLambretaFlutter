
class UserController {
  static String loginLogged = "";


  void login(String login) {
    loginLogged = login;
  }

  void logout(String login) {
    loginLogged = "";
  }

}