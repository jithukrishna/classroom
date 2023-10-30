
import 'dart:developer';

import 'package:classroom/feature/classrooms/classrooms_screen.dart';
import 'package:classroom/feature/classrooms/model/classrommmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../utilis/api_support.dart';
import '../model/classrooms.dart';



class ClassRoomsProvider with ChangeNotifier {
  bool loader = false;

  List<Classrooms>? classroomsList;
  ///GET Student LIST
  Future<void> getClassRoom(context) async {
    try {
      loader = true;
      notifyListeners();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? key = "33Bad";//preferences.getString("key");
      log(key.toString());
      final Uri url = Uri.parse(ApiSupport.baseUrl +
          ApiSupport.getAllClassRooms(key: key!));

      final Response response =
      await get(url, headers: ApiSupport.header());

      debugPrint(ApiSupport.header().toString());
      debugPrint(url.toString());
      debugPrint(response.body);

      if (response.statusCode == 200) {
        loader = false;
        notifyListeners();
        log(response.body);
        ClassRoomModel classRoomModel = classRoomModelFromJson(response.body);
        classroomsList = classRoomModel.classrooms;
        log(classroomsList!.length.toString());

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
  late Classrooms classroomDetails= Classrooms();
  Future<void> getClassRoomDetails(context,id) async {
    try {
      loader = true;
      notifyListeners();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? key = "33Bad";//preferences.getString("key");
      log(key.toString());
      final Uri url = Uri.parse(ApiSupport.baseUrl +
          ApiSupport.getClassRoomsDetails(key: key!, classroom_id: id.toString()));

      final Response response =
      await get(url, headers: ApiSupport.header());

      debugPrint(ApiSupport.header().toString());
      debugPrint(url.toString());
      debugPrint(response.body);

      if (response.statusCode == 200) {
        loader = false;
        notifyListeners();
        log(response.body);
        classroomDetails =  classRoomsFromJson(response.body);


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
