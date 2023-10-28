import 'package:classroom/feature/students/students_list.dart';
import 'package:classroom/feature/subjects/subjects_list.dart';
import 'package:classroom/utilis/colour_class.dart';
import 'package:classroom/utilis/text_style.dart';
import 'package:flutter/material.dart';

import '../classrooms/classrooms_screen.dart';
import 'custom_animated_bottom_bar.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("ClassRoom",style: TextStyleClass.mainHeadingBlackSemi22,),
          backgroundColor: ColorClass.primaryDark,
        ),
        body: getBody(),
        bottomNavigationBar: _buildBottomBar()
    );
  }

  Widget _buildBottomBar(){
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Students'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Subject'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'ClassRoom ',
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),

      ],
    );
  }


  Widget getBody() {
    List<Widget> pages = [
      StudentsList(),
      SubjectsList(),
      ClassRooms(),

    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }


}