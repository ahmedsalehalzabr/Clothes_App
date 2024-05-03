// class User {
//   String? email;
//   String? password;
//
//   User({this.email, this.password});
//
//   User.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     password = json['password'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['password'] = this.password;
//     return data;
//   }
// }
class User {
  User({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;

  User.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
  }


}