import 'package:getya/models/user.dart';

class UserController {
  Future<User> signUp(
    String firstname,
    String lastname,
    String gender,
    String dob,
    String phone,
    String address,
  ) async {
    User.signUp(
      firstname,
      lastname,
      gender,
      dob,
      phone,
      address,
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
  ) async {
    User.updateUserInfo(firstname, lastname, gender, dob, phone, address);
    return currentUser;
  }
}
