import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../utilis/api_support.dart';
import '../model/studentmodel.dart';
import '../model/students.dart';


class StudentProvider with ChangeNotifier {
  bool loader = false;
 /* AnalyticProfessionalModel? analyticProfessionalModel;

  List<pi.ChartData> chartData = [];
  List<ChartData> approved = [];
  List<ChartData> rejected = [];
  List<ChartData> pending = [];
  double profileCompletion = 0.0;
  List<ChartDataAssessment> chartDataAssessmentList = [];*/
  List<Students>? students;
  ///GET Student LIST
  Future<void> getStudent(context) async {
    try {
      loader = true;
      notifyListeners();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? key = "33Bad";//preferences.getString("key");
      log(key.toString());
      final Uri url = Uri.parse(ApiSupport.baseUrl +
          ApiSupport.getAllStudents(key: key!));

      final Response response =
      await get(url, headers: ApiSupport.header());

      debugPrint(ApiSupport.header().toString());
      debugPrint(url.toString());
      debugPrint(response.body);

      if (response.statusCode == 200) {
        loader = false;
        notifyListeners();
        log(response.body);
        StudentModel studentModel = studentModelFromJson(response.body);
        students = studentModel.students;
        log(students!.length.toString());

        notifyListeners();
      } else if (response.statusCode == 401) {
        loader = false;

        notifyListeners();
      } else {
        loader = false;
        notifyListeners();
        debugPrint("get Students ${response.statusCode}");
        debugPrint(response.body.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
  late Students studentsDetails= Students();
  Future<void> getStudentDetails(context,id) async {
    try {
      loader = true;
      notifyListeners();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? key = "33Bad";//preferences.getString("key");
      log(key.toString());
      final Uri url = Uri.parse(ApiSupport.baseUrl +
          ApiSupport.getStudentDetailsAPI(key: key!, student_id: id.toString()));

      final Response response =
      await get(url, headers: ApiSupport.header());

      debugPrint(ApiSupport.header().toString());
      debugPrint(url.toString());
      debugPrint(response.body);

      if (response.statusCode == 200) {
        loader = false;
        notifyListeners();
        log(response.body);
        studentsDetails =  studentsFromJson(response.body);


        notifyListeners();
      } else if (response.statusCode == 401) {
        loader = false;

        notifyListeners();
      } else {
        loader = false;
        notifyListeners();
        debugPrint("get Students ${response.statusCode}");
        debugPrint(response.body.toString());
      }
    } catch (e) {
      rethrow;
    }
  }
}
