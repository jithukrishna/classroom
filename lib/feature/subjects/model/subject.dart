


import 'dart:convert';

Subjects subjectFromJson(String str) =>
    Subjects.fromJson(json.decode(str));

String studentToJson(Subjects data) =>
    json.encode(data.toJson());

class Subjects {
  int? credits;
  int? id;
  String? name;
  String? teacher;

  Subjects({this.credits, this.id, this.name, this.teacher});

  Subjects.fromJson(Map<String, dynamic> json) {
    credits = json['credits'];
    id = json['id'];
    name = json['name'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credits'] = this.credits;
    data['id'] = this.id;
    data['name'] = this.name;
    data['teacher'] = this.teacher;
    return data;
  }
}