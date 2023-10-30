

import 'dart:convert';

import 'classrooms.dart';

ClassRoomModel classRoomModelFromJson(String str) =>
    ClassRoomModel.fromJson(json.decode(str));

String classRoomModelToJson(ClassRoomModel data) =>
    json.encode(data.toJson());

class ClassRoomModel {
  List<Classrooms>? classrooms;

  ClassRoomModel({this.classrooms});

  ClassRoomModel.fromJson(Map<String, dynamic> json) {
    if (json['classrooms'] != null) {
      classrooms = <Classrooms>[];
      json['classrooms'].forEach((v) {
        classrooms!.add(new Classrooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classrooms != null) {
      data['classrooms'] = this.classrooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

