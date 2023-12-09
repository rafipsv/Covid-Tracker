// ignore_for_file: file_names

class LoginModel {
  String? status;
  String? messege;
  List<User>? user;

  LoginModel({this.status, this.messege, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messege'] = messege;
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? userid;
  String? username;
  String? password;

  User({this.userid, this.username, this.password});

  User.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
