import 'package:classroom/feature/classrooms/classroomdetails.dart';
import 'package:classroom/feature/classrooms/model/classrooms.dart';
import 'package:classroom/feature/classrooms/provider/classroom_provider.dart';
import 'package:classroom/utilis/colour_class.dart';
import 'package:classroom/utilis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/shimmerwidget.dart';




class ClassRoomsScreen extends StatefulWidget {

  @override
  _ClassRoomsScreenState createState() => _ClassRoomsScreenState();
}

class _ClassRoomsScreenState extends State<ClassRoomsScreen> {

  @override
  void initState() {
    ClassRoomsProvider classRoomsProvider =
    Provider.of<ClassRoomsProvider>(context, listen: false);

    Future.microtask(() {
      classRoomsProvider.getClassRoom(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Consumer<ClassRoomsProvider>(
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
              ) : snapshot.classroomsList == null ? Container(
                child: RefreshIndicator(child: Center(
                  child: Text('No Data'),
                ),onRefresh: () async {
                  await Future.delayed(Duration(milliseconds: 1500));
                  setState(() {
                    ClassRoomsProvider classRoomsProvider =
                    Provider.of<ClassRoomsProvider>(context, listen: false);

                    Future.microtask(() {
                      classRoomsProvider.getClassRoom(context);
                    });
                    //itemCount = itemCount + 1;
                  });
                },),
              ): RefreshIndicator(child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemCount: snapshot.classroomsList!.length,

                itemBuilder: (context, index) {
                  Classrooms classrooms = snapshot.classroomsList![index];
                  //String lName = classrooms.name!.split(" ").last.isEmpty.toString();
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
                                    ClassRoomDetails(classrooms),
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
                                      child: Text('${classrooms.name![0]} ${classrooms.name![classrooms.name!.length-1]}',style: TextStyleClass.mainHeadingBlackSemi14,),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                //const Text('Name : ',style: TextStyleClass.mainHeadingBlackSemi14,),
                                Text(classrooms.name!,textAlign: TextAlign.start,style: TextStyleClass.mainHeadingBlackSemi14,)
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
                  ClassRoomsProvider classRoomsProvider =
                  Provider.of<ClassRoomsProvider>(context, listen: false);

                  Future.microtask(() {
                    classRoomsProvider.getClassRoom(context);
                  });
                  //itemCount = itemCount + 1;
                });
              },)

            );
          }),);

  }


}