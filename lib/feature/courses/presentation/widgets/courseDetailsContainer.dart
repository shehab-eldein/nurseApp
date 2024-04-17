import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/what_will_Learn_container.dart';

import '../../../../core/constant/textStyles.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/widgets/video_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetailsContainer extends StatelessWidget {

 final Course course;
 final AppLocalizations appLocalizations;




  const CourseDetailsContainer({super.key, required this.course, required this.appLocalizations});

  @override
  Widget build(BuildContext context) {
    final language = context.read<LanguageBloc>().state.languageCode;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          Text(
            appLocalizations.courseIntro,
            style: TextStyles.font18TxtBlack500,
          ),
          const SizedBox(
            height: 8,
          ),
          //todo get url from object
          VideoContainer(
              videoUrl:
              "https://app.nurse-space.com/storage/33/660ac6f0515a7_2550149143272270178.MOV"),
          const SizedBox(
            height: 16,
          ),
      
          course.userLearn != null &&
              course.userLearn!['ar']!.isNotEmpty
              ? WhatWillLearnContainer(
              appLocalizations: appLocalizations,
              learnList: language == "ar"
                  ? course.userLearn!["ar"]!
                  : course.userLearn!["en"]!)
              : const SizedBox(),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
