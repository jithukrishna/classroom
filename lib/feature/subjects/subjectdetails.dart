import 'package:classroom/feature/students/model/studentmodel.dart';
import 'package:classroom/feature/students/provider/student_provider.dart';
import 'package:classroom/feature/subjects/model/subject.dart';
import 'package:classroom/feature/subjects/provider/subjectprovider.dart';
import 'package:classroom/utilis/colour_class.dart';
import 'package:classroom/utilis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/shimmerwidget.dart';





class SubjectDetails extends StatefulWidget {
  final Subjects subjects;
  const SubjectDetails(this.subjects);

  @override
  _SubjectDetailsState createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {


  @override
  void initState() {
    SubjectProvider subjectProvider =
    Provider.of<SubjectProvider>(context, listen: false);

    Future.microtask(() {
      subjectProvider.getSubjectDetails(context,widget.subjects.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: ColorClass.primaryDark,
        titleSpacing: 0,
        title: const Text("Subject Details",style: TextStyleClass.mainHeadingBlackSemi22,),
        actions: <Widget>[

        ],
      ),
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
              ) : snapshot.subjectDetails == null ? Container(
                child: const Text('No Data'),
              ) :Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorClass.blackColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorClass.primaryDark),
                              color: ColorClass.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text('${snapshot.subjectDetails.name![0]} ${snapshot.subjectDetails.name![snapshot.subjectDetails.name!.length-1]}',style: TextStyleClass.mainHeadingBlackSemi14,),
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
                        child: Row(
                          children: [
                            const Text('Subject : '),
                            Text(snapshot.subjectDetails.name!,style: TextStyleClass.mainHeadingBlackSemi18,),
                          ],

                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                        child: Row(
                          children: [
                            const Text('Teacher : '),
                            Text(snapshot.subjectDetails.teacher!,style: TextStyleClass.mainHeadingBlackSemi14,),
                          ],

                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
                        child: Row(
                          children: [
                            const Text('Credits : '),
                            Text(snapshot.subjectDetails.credits!.toString(),style: TextStyleClass.mainHeadingBlackSemi14,),
                          ],

                        ),
                      ),

                    ],
                  ),
                ),
              ),


            );
          }),);

  }


}
