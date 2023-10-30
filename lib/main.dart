import 'package:classroom/feature/subjects/provider/subjectprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/classrooms/provider/classroom_provider.dart';
import 'feature/dashboard/bottom_sheet.dart';
import 'feature/students/provider/student_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SubjectProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClassRoomsProvider(),
        ),

        //
      ],
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'ClassRoom',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: "ProximaNova",
        ),
        home: MyHomePage(),
      ),
    );
  }
}

