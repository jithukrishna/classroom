import 'package:classroom/feature/students/model/studentmodel.dart';
import 'package:classroom/feature/students/provider/student_provider.dart';
import 'package:classroom/feature/students/studentdetails.dart';
import 'package:classroom/utilis/colour_class.dart';
import 'package:classroom/utilis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/shimmerwidget.dart';
import 'model/students.dart';




class StudentsList extends StatefulWidget {

  @override
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {


  @override
  void initState() {
    StudentProvider studentProvider =
    Provider.of<StudentProvider>(context, listen: false);

    Future.microtask(() {
      studentProvider.getStudent(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Consumer<StudentProvider>(
        builder: (context, snapshot, _) {
          return SafeArea(
            child: snapshot.loader? ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (ctx, i) {
                return Container(
                  height: 1,
                  color: ColorClass.lightGrey.withOpacity(0.5),
                );
              },
              itemBuilder: (ctx, i) {
                return const ShimmerWidget(
                  height: 40,
                  width: double.infinity,
                  bottom: 0,
                  left: 0,
                  radius: 0,
                  top: 0,
                  right: 0,
                );
              },
              itemCount: 100,
            ) : snapshot.students == null ? Container(): RefreshIndicator(child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: snapshot.students!.length,

              itemBuilder: (context, index) {
                Students students = snapshot.students![index];
                String lName = students.name!.split(" ").last.isEmpty.toString();
                return Container(
                  margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorClass.blackColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  StudentsDetails(students),
                            ),
                          );
                        },
                        child:  Container(
                          padding: const EdgeInsets.all(7.0),
                          width: double.infinity,
                          child:Row(
                            children: [
                              Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: ColorClass.primaryDark),
                                    color: ColorClass.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text('${students.name![0]} ${students.name![students.name!.length-1]}',style: TextStyleClass.mainHeadingBlackSemi14,),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              //const Text('Name : ',style: TextStyleClass.mainHeadingBlackSemi14,),
                              Text(students.name!,textAlign: TextAlign.start,style: TextStyleClass.mainHeadingBlackSemi14,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ), onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 1500));
              setState(() {
                StudentProvider studentProvider =
                Provider.of<StudentProvider>(context, listen: false);

                Future.microtask(() {
                  studentProvider.getStudent(context);
                });
                //itemCount = itemCount + 1;
              });
            },)

          );
        }),);

  }


}