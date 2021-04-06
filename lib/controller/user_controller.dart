import 'package:getya/models/user.dart';

class UserController {
  Future<User> signUp(
    String firstname,
    String lastname,
    String gender,
    String dob,
    String phone,
    String address,
    String email,
  ) async {
    User.signUp(
      firstname,
      lastname,
      gender,
      dob,
      phone,
      address,
      email,
    );
    return currentUser;
  }

  Future<dynamic> signIn(
    String email,
    String password,
  ) async {
    User.signIn(email, password);
  }

  Future<User> updateUserInfo(
    String firstname,
    String lastname,
    String gender,
    String dob,
    String phone,
    String address,
    String email,
  ) async {
    User.updateUserInfo(
      firstname,
      lastname,
      gender,
      dob,
      phone,
      address,
      email,
    );
    return currentUser;
  }
}
