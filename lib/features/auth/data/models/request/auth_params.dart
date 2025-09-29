// {
//     "name" : "Sayed",
//     "email" : "sayed12300@gmail.com",
//     "password":"12345678",
//     "password_confirmation" :"12345678"
// }

class AuthParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  AuthParams({this.name, this.email, this.password, this.passwordConfirmation});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
    };
  }
}
