

import 'dart:convert';

import 'package:classroom/feature/subjects/model/subject.dart';

SubjectModel subjectModelFromJson(String str) =>
    SubjectModel.fromJson(json.decode(str));

String studentModelToJson(SubjectModel data) =>
    json.encode(data.toJson());

class SubjectModel {
  List<Subjects>? subjects;

  SubjectModel({this.subjects});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

