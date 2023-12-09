// ignore_for_file: file_names

class RegisterModel {
  String? status;
  String? messege;
  User? user;

  RegisterModel({this.status, this.messege, this.user});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messege'] = messege;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  int? userId;

  User({this.name, this.userId});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['userId'] = userId;
    return data;
  }
}
