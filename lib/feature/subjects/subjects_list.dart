import 'dart:developer';

import 'package:classroom/feature/subjects/model/subject.dart';
import 'package:classroom/feature/subjects/provider/subjectprovider.dart';
import 'package:classroom/feature/subjects/subjectdetails.dart';
import 'package:classroom/utilis/colour_class.dart';
import 'package:classroom/utilis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/shimmerwidget.dart';




class SubjectsList extends StatefulWidget {

  @override
  _SubjectsListState createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {

  @override
  void initState() {
    SubjectProvider subjectProvider =
    Provider.of<SubjectProvider>(context, listen: false);

    Future.microtask(() {
      log('###########');
      subjectProvider.getSubject(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Consumer<SubjectProvider>(
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
              ) : snapshot.subjects== null ? Container(): ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemCount: snapshot.subjects!.length,

                itemBuilder: (context, index) {
                  Subjects subjects = snapshot.subjects![index];
                  String lName = subjects.name!.split(" ").last.isEmpty.toString();
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
                                    SubjectDetails(subjects),
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
                                      child: Text('${subjects.name![0]} ${subjects.name![subjects.name!.length-1]}',style: TextStyleClass.mainHeadingBlackSemi14,),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                //const Text('Name : ',style: TextStyleClass.mainHeadingBlackSemi14,),
                                Text(subjects.name!,textAlign: TextAlign.start,style: TextStyleClass.mainHeadingBlackSemi14,)
                              ],
                            ),
                          ),
                        )
                        /*Container(
                          padding: const EdgeInsets.all(7.0),
                          width: double.infinity,
                          child:Row(
                            children: [
                              const Text('Email : '),
                              Text(students.email!,textAlign: TextAlign.start,style: TextStyleClass.darkGrey14Regular,)
                            ],
                          ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(7.0),
                          width: double.infinity,
                          child:Row(
                            children: [
                              const Text('Age : '),
                              Text(students.age!.toString(),textAlign: TextAlign.start,style: TextStyleClass.darkGrey14Regular,)
                            ],
                          ),
                      ),*/



                      ],
                    ),
                  );
                },
              ),

            );
          }),);

  }

}