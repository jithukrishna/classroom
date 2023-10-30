import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';

class ApiSupport {
  ///APP NAME
  static const String appName = "ClassRoom";

  static const String baseUrl = "https://nibrahim.pythonanywhere.com";

  static String getAllStudents(
      {required String key}) {
    return "/students/?api_key=$key";
  }
  static String getStudentDetailsAPI(
      {required String student_id,required String key}) {
    return "/students/$student_id?api_key=$key";
  }

  static String getAllSubjects(
      {required String key}) {
    return "/subjects/?api_key=$key";
  }

  static String getSubjectDetails(
      {required String subject_id,required String key}) {
    return "/subjects/$subject_id?api_key=$key";
  }

  static String getAllClassRooms(
      {required String key}) {
    return "/classrooms/?api_key=$key";
  }
  static String getClassRoomsDetails(
      {required String classroom_id,required String key}) {
    return "/classrooms/$classroom_id?api_key=$key";
  }
///subjects/?api_key=33Bad
  static Map<String, String> header() {
    return {
      "accept": "application/json",
      "content-type": "application/json",
    };
  }

  //https://nibrahim.pythonanywhere.com/students/1?api_key=5F0ae
  //https://nibrahim.pythonanywhere.com/students/?api_key=5F0ae

}
