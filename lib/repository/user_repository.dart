import '../model/user.dart';

class UserRepository {
  static final List<User> _users = [];

  static List<User> getUsers() {
    return _users;
  }

  static User? getUserByLogin(String login) {
    try {
      return _users.firstWhere((user) => user.login == login);
    }catch(e){
      return null;
    }
  }

  static void createUser(String login, String password) {
    final user = User(
        login: login,
        password: password
    );
    _users.add(user);
  }

}