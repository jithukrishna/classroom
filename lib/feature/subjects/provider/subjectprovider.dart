import 'dart:developer';

import 'package:classroom/feature/subjects/model/subject.dart';
import 'package:classroom/feature/subjects/model/subjectmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../utilis/api_support.dart';



class SubjectProvider with ChangeNotifier {
  bool loader = false;

  List<Subjects>? subjects;
  /* AnalyticProfessionalModel? analyticProfessionalModel;

  List<pi.ChartData> chartData = [];
  List<ChartData> approved = [];
  List<ChartData> rejected = [];
  List<ChartData> pending = [];
  double profileCompletion = 0.0;
  List<ChartDataAssessment> chartDataAssessmentList = [];*/
  //List<Students>? students;
  ///GET Student LIST
  Future<void> getSubject(context) async {
    try {
      loader = true;
      notifyListeners();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? key = "33Bad";//preferences.getString("key");
      log(key.toString());
      final Uri url = Uri.parse(ApiSupport.baseUrl +
          ApiSupport.getAllSubjects(key: key!));

      final Response response =
      await get(url, headers: ApiSupport.header());

      debugPrint(ApiSupport.header().toString());
      debugPrint(url.toString());
      debugPrint(response.body);

      if (response.statusCode == 200) {
        loader = false;
        notifyListeners();
        log(response.body);

        SubjectModel subjectModel = subjectModelFromJson(response.body);
        subjects = subjectModel.subjects;
        log(subjects!.length.toString());

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
  late Subjects subjectDetails= Subjects();
  Future<void> getSubjectDetails(context, id) async {
    try {
      log('#####################');
      loader = true;
      notifyListeners();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? key = "33Bad";//preferences.getString("key");
      log(key.toString());
      final Uri url = Uri.parse(ApiSupport.baseUrl +
          ApiSupport.getSubjectDetails(key: key!, subject_id: id.toString()));

      final Response response =
      await get(url, headers: ApiSupport.header());

      debugPrint(ApiSupport.header().toString());
      debugPrint(url.toString());
      debugPrint(response.body);

      if (response.statusCode == 200) {
        loader = false;
        notifyListeners();
        log(response.body);
        subjectDetails = subjectFromJson(response.body);


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
