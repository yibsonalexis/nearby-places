// import 'dart:convert';

// UserModel userModelFromJson(String str, String idUser) =>
//     UserModel.fromJson(json.decode(str), idUser);

// String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String idUser;
  String identification;
  String name;
  String lName;
  String userName;
  String password;

  UserModel({
    this.idUser = "",
    this.identification = "",
    this.name = "",
    this.lName = "",
    this.userName = "",
    this.password = "",
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String idUser) =>
      UserModel(
        idUser: idUser,
        identification: json["identification"],
        name: json["name"],
        lName: json["lName"],
        userName: json["userName"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "identification": identification,
        "name": name,
        "lName": lName,
        "userName": userName,
        "password": password,
      };
}
