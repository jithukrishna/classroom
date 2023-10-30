

import 'dart:convert';

Students studentsFromJson(String str) =>
    Students.fromJson(json.decode(str));

String studentsToJson(Students data) =>
    json.encode(data.toJson());

class Students {
  int? age;
  String? email;
  int? id;
  String? name;

  Students({this.age, this.email, this.id, this.name});

  Students.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}