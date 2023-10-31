
//conference


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilis/text_style.dart';

class ConferenceRoom extends StatelessWidget {
  final int count;
  const ConferenceRoom(this.count);

  final double runSpacing = 4;
  final double spacing = 4;
  final int listSize = 17;
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
                margin: EdgeInsets.all(20),
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