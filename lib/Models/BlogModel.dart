// ignore_for_file: file_names

class BlogModel {
  String? status;
  String? messege;
  List<Blogs>? blogs;

  BlogModel({this.status, this.messege, this.blogs});

  BlogModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(Blogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['messege'] = messege;
    if (blogs != null) {
      data['blogs'] = blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blogs {
  int? id;
  String? title;
  String? des;
  String? image;

  Blogs({this.id, this.title, this.des, this.image});

  Blogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    des = json['des'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['des'] = des;
    data['image'] = image;
    return data;
  }
}
