import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';
import 'package:nurse_space/feature/courses/data/models/test_info/test_info.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/constant/textStyles.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../data/models/lesson/lesson.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TestsInfoContainer extends StatelessWidget {

  final List<TestInfo> testInfoList;

  const TestsInfoContainer({
    super.key,
    required this.testInfoList});

  @override
  Widget build(BuildContext context) {
    final language = context.read<LanguageBloc>().state.languageCode;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        children: testInfoList.asMap().
        entries.map((entry)  {
          final int index = entry.key;
          final  TestInfo testInfo = entry.value;


          return Container(
            width: double.infinity,
            height: 150,
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white, // Background color of the container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1), // Shadow color
                  spreadRadius: 0,
                  blurRadius: 0.5,
                  offset: Offset(0, 2), // Offset in x and y directions
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${appLocalizations.examNumber} ${index+1}",
                      style: TextStyles.font18Primary600,
                    ),
                   SizedBox(height: 16,),

                   WidgetTextRow(

                      myWidget: Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(3.5),
                        decoration: BoxDecoration(
                            color: AppColors.green.withAlpha(100),
                            borderRadius: BorderRadius.circular(25)
                        ),

                        child: Container(

                          height: 22,
                          width: 22,
                          padding: EdgeInsets.all(2),

                          decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(
                            child: Text(
                              testInfo.correctAnswers?.toString() ?? "0",
                              style: TextStyles.font13White500,

                            ),
                          ),
                        ),
                      ),
                      txt: appLocalizations.correctAnswer
                      ,
                      textColor: AppColors.primary,
                      iconFirst: true,
                      mainAxisAlignment: MainAxisAlignment.start,
                      textStyle: TextStyles.font14TxtPrimary400,
                      spaceBetween: 8,






                    ),
                    SizedBox(height: 8,),
                    WidgetTextRow(

                      myWidget: Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(3.5),
                       decoration: BoxDecoration(
                           color: AppColors.red.withAlpha(100),
                           borderRadius: BorderRadius.circular(25)
                       ),
                        child: Container(
                        
                          height: 22,
                          width: 22,
                          padding: EdgeInsets.all(2),
                        
                          decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(
                            child: Text(
                              testInfo.wrongAnswers?.toString() ?? "0",
                              style: TextStyles.font13White500,
                        
                            ),
                          ),
                        ),
                      ),
                      txt: appLocalizations.wrongAnswer
                      ,
                      textColor: AppColors.primary,
                      iconFirst: true,
                      mainAxisAlignment: MainAxisAlignment.start,
                      textStyle: TextStyles.font14TxtPrimary400,
                      spaceBetween: 8,






                    ),


                  ],
                ),
                Spacer(),
                CircularPercentIndicator(

                  radius: 65.0,
                  lineWidth: 15.0,
                  //Todo: Evaluation
                  percent: (testInfo.correctAnswers! / testInfo.questionsCount!),
                  //Todo: check language
                  reverse: true,
                  backgroundColor: AppColors.red,


                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text(
                        appLocalizations.totalQuestions,
                        style: TextStyles.font14TxtPrimary400,
                      ),
                      SizedBox(height: 8),
                      Text(
                        testInfo.questionsCount?.toString() ?? "0",
                        style: TextStyles.font14TxtPrimary600,

                      ),
                    ],
                  ),
                  progressColor: AppColors.green,

                  circularStrokeCap: CircularStrokeCap.round,

                ),

              ],
            ),

          );
        }).toList() ,
      ),
    ) ;
  }
}
