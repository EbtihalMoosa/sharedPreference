import 'dart:convert';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? image;

  UserModel({this.name, this.email, this.password, this.phone, this.image});
//function return map

  // String toJason() => jsonEncode(toMap());
  // factory UserModel.fromJson(String source) => UserModel();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // "name"= name;
      // "email"= email;
      // "password"= password;
      // "phone"= phone;
      // "image"= image;
    };
  }
}
//convert the object to map
