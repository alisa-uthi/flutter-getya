class User {
  String firstname;
  String lastname;
  String dob;
  String gender;
  String phone;

  User({
    this.dob,
    this.firstname,
    this.gender,
    this.lastname,
    this.phone,
  });
}

User currentUser = User(
  firstname: "Benimaru",
  lastname: "Shinmon",
  gender: "Male",
  phone: "038-485-2394",
  dob: "1999-02-24",
);
