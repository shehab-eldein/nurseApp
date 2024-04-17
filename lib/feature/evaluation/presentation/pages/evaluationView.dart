import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/errorWidget.dart';
import 'package:nurse_space/core/widgets/loader.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';
import 'package:nurse_space/feature/evaluation/presentation/manager/evaluationCubit.dart';
import 'package:nurse_space/feature/evaluation/presentation/widgets/doneList.dart';
import 'package:nurse_space/feature/evaluation/presentation/widgets/evaluationCard.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/constant/imagesManager.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/widgets/typeCard.dart';
import '../../../search/presentation/widgets/searchBar.dart';
import '../../data/models/evaluation.dart';

class EvaluationView extends StatelessWidget {
  EvaluationView({Key? key}) : super(key: key);

  late LayoutHandler layoutHandler;
  List<dynamic> certificateList = [];


  @override
  Widget build(BuildContext context) {
    layoutHandler = LayoutHandler(context);
    context.read<EvaluationCubit>().getEvaluation(userId: 1);

    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CustomSearchBar(),


            BlocBuilder<EvaluationCubit, EvaluationState>(
              builder: (context, state) {
                return state.when(
                    loading:() {
                      return const Center(child: Loader(showText: false,));
                    },
                    success: (evaluation) {
                      certificateList = evaluation.certificates ?? [];

                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: layoutHandler.mainHorizontalPadding()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "تقييم الأداء",
                              style: TextStyles.font18TxtBlack500,
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  color: AppColors.green.withAlpha(40),
                                  child: WidgetTextRow(
                                    myWidget: Icon(
                                      Icons.turn_slight_right,
                                      color: AppColors.green, size: 15,),
                                    txt: '7٪',
                                    textColor: AppColors.green
                                    ,

                                  ),
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  "معدل الإرتفاع عن الشهر الماضي",
                                  style: TextStyles.font13TxtDark600,
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  " يناير 2024",
                                  style: TextStyles.font14TxtLightGrey500,
                                )
                              ],
                            ),
                            SizedBox(height: 16,),
                            Align(


                              alignment: AlignmentDirectional.center,
                              child: CircularPercentIndicator(

                                radius: 100.0,
                                lineWidth: 30.0,
                                //Todo: Evaluation
                                percent: 0.0,
                                //Todo: check language
                                reverse: true,
                                backgroundColor: AppColors.accent.withAlpha(50),


                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text(
                                      "التقييم التراكمي",
                                      style: TextStyles.font16TxtLightGrey500,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "0%",
                                      style: TextStyles.font28TxtBlack500,

                                    ),
                                  ],
                                ),
                                progressColor: AppColors.green,

                                circularStrokeCap: CircularStrokeCap.square,
                                // arcBackgroundColor: AppColors.accent.withAlpha(80),

                              ),
                            ),
                            Text(
                              "تم الإنتهاء من",
                              style: TextStyles.font18TxtBlack500,
                            ),
                            SizedBox(height: 16,),
                             DoneList(
                               courses: evaluation.courses ?? 0,
                               hours: evaluation.hours ?? 0,
                               exams: evaluation.courseTests ?? 0,
                               files: 0,),
                            SizedBox(height: 16,),


                            certificateList.isEmpty  ?SizedBox()
                                :  Column(
                                  children: [
                                    Text("الشهادات",
                                      style: TextStyles.font18TxtBlack500,),
                                    SizedBox(height: 16,),

                                    Column(
                                      children: certificateList.map((certificate) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 0),
                                          child: EvaluationCard(
                                            iconData: Icons.bookmarks_outlined,
                                            title: "عنوان",
                                            width: context.screenWidth,
                                            subTitle: "العنوان الفرعي",
                                          ),);
                                      }).toList(),
                                    ),
                                  ],
                                ),



                          ],
                        ),
                      );
                    },
                    error: (e){

                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 150),
                          child: const CustomErrorWidget());
                    });
              },
            )


          ],
        ),
      ),
    );
  }
}
