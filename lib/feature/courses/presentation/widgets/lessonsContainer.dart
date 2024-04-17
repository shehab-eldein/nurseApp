import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';
import 'package:nurse_space/feature/courses/presentation/pages/lessonView.dart';

import '../../../../core/constant/textStyles.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../data/models/lesson/lesson.dart';

class LessonsContainer extends StatelessWidget {

  final List<Lesson> lessons;

  const LessonsContainer({
    super.key,
    required this.lessons});

  @override
  Widget build(BuildContext context) {
    final language = context.read<LanguageBloc>().state.languageCode;
    return SingleChildScrollView(
      child: Column(
       children: lessons.asMap().
       entries.map((entry)  {
         final int index = entry.key;
         final Lesson lesson = entry.value;


         return GestureDetector(
           onTap: () => context.popUpPage(LessonView(lesson: lesson, index: index+1)),
           child: Container(
             width: double.infinity,
             height: 56,
             margin: EdgeInsets.symmetric(vertical: 4),
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(5),
               color: Colors.white, // Background color of the container
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.1), // Shadow color
                   spreadRadius: 0,
                   blurRadius: 0.2,
                   offset: Offset(0, 1), // Offset in x and y directions
                 ),
               ],
             ),
             child: WidgetTextRow(

               myWidget: Container(

                 height: 30,
                 width: 30,
                 decoration: BoxDecoration(
                   border: Border.all(color: AppColors.accent,width: 2),
                   borderRadius: BorderRadius.circular(25)
                 ),
                 child: Center(
                   child: Text(
                       (index+1).toString(),
                     style: TextStyles.font16Accent600,

                   ),
                 ),
               ),
               txt:  language == "ar"
                   ?lesson.name!["ar"] ?? "لا يوجد عنوان متاح"
                   : lesson.name!["en"] ?? "No title available"
               ,
               textColor: AppColors.primary,
               iconFirst: true,
               mainAxisAlignment: MainAxisAlignment.start,
               textStyle: TextStyles.font14TxtPrimary400,
               spaceBetween: 8,






             ),

           ),
         );
       }).toList() ,
      ),
    ) ;
  }
}
