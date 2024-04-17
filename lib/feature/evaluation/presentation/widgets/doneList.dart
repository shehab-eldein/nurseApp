import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';

import 'evaluationCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DoneList extends StatelessWidget {
  final int courses ;
  final int hours ;
  final int exams ;
  final int files ;



  const DoneList({Key? key, required this.courses, required this.hours, required this.exams, required this.files}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;



    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(

          children: [
            EvaluationCard(
              iconData: Icons.bookmarks_outlined,
              title: courses.toString(),
              width: context.screenWidth * 0.45,
              subTitle: appLocalizations.courses,
            ),
            SizedBox(height: 8,),
            EvaluationCard(
              iconData: Icons.video_library_outlined,
              title: hours.toString(),
              width: context.screenWidth * 0.45,
              subTitle: appLocalizations.hours,
            ),

          ],
        ),
        Spacer(),
        Column(

          children: [
            EvaluationCard(
              iconData: Icons.file_copy_outlined,
              title: exams.toString(),
              width: context.screenWidth * 0.45,
              subTitle: appLocalizations.exams
            ),
            SizedBox(height: 8,),
            EvaluationCard(
              iconData: Icons.folder_copy_outlined,
              title: files.toString(),
              width: context.screenWidth * 0.45,
              subTitle:appLocalizations.files,
            ),

          ],
        ),
      ],
    );
  }
}
