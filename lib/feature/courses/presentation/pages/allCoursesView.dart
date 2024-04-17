import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/titleBackAppBar.dart';

import '../../../../core/constant/appColors.dart';
import '../../data/models/course/course.dart';
import '../widgets/courseSmallCard.dart';

class AllCoursesView extends StatelessWidget {
  final List<Course>  courses;
  const AllCoursesView({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: TitleBackAppBar(title: "احدث الدورات",),
      body: ListView.builder(
        itemCount: courses.length,
        padding: EdgeInsets.symmetric(
          horizontal: LayoutHandler(context).mainHorizontalPadding()
        ),

        scrollDirection: Axis.vertical,// Number of items in the list
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              child: CourseSmallCard(course: courses[index],)


          );

        },
      ),
    );
  }
}
