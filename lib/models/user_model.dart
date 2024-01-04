import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? email;
  String? pass;
  String? fullname;
  List<Map<String, dynamic>>? todos;

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullname = json['fullname'];
    pass = json['pass'];
    todos = json['todo'];
  }
}

class TodoModel {
  String? title;
  String? desc;

  TodoModel({this.title, this.desc});

  factory TodoModel.fromMap(Map<String, dynamic> data) {
    return TodoModel(
      title: data['title'] as String,
      desc: data['dessc'] as String
    );
  }
}
