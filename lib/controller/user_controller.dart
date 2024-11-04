import '../model/user.dart';
import '../repository/user_repository.dart';

class UserController {
  static String loginLogged = "";

  List<User> fetchUsers() {
    return UserRepository.getUsers();
  }

  bool login(String login, String password) {
    User? user = UserRepository.getUserByLogin(login);
    if(user==null){
      return false;
    }else{
      if(user.password == password){
        loginLogged = login;
        return true;
      }else{
        return false;
      }
    }
  }

  bool createUser(String login, String password) {
    User? user = UserRepository.getUserByLogin(login);
    if(user==null){
      UserRepository.createUser(login, password);
      return true;
    }else{
      return false;
    }

  }

}