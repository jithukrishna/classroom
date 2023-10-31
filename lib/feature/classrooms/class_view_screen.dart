

import 'package:classroom/utilis/text_style.dart';
import 'package:flutter/material.dart';

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Title')),
        body: AlignedGrid(),
      ),
    );
  }
}*/

class ClassRoomView extends StatelessWidget {
  final int count;
  const ClassRoomView(this.count);
  final double runSpacing = 4;
  final double spacing = 4;
 // final int listSize = wid;
  final columns = 4;

  @override
  Widget build(BuildContext context) {
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) / columns;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
            child:  Text('T',style: TextStyleClass.mainHeadingBlueSemi22,),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            runSpacing: runSpacing,
            spacing: spacing,
            alignment: WrapAlignment.center,
            children: List.generate(count, (index) {
              return Container(
                // margin: EdgeInsets.all(20),
                width: w,
                height: w,
                child: Center(
                  child:  Text('S',style: TextStyleClass.mainHeadingBlackSemi22,),
                ),
                color: Colors.green[200],
              );
            }),
          ),
        ],
      ),
    );
  }
}