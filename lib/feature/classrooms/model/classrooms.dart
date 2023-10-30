


import 'dart:convert';

Classrooms classRoomsFromJson(String str) =>
    Classrooms.fromJson(json.decode(str));

String classRoomsToJson(Classrooms data) =>
    json.encode(data.toJson());

class Classrooms {
  int? id;
  String? layout;
  String? name;
  int? size;

  Classrooms({this.id, this.layout, this.name, this.size});

  Classrooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    layout = json['layout'];
    name = json['name'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['layout'] = this.layout;
    data['name'] = this.name;
    data['size'] = this.size;
    return data;
  }
}