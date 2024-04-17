import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/titleBackAppBar.dart';
import 'package:nurse_space/core/widgets/video_container.dart';

import '../../../../core/constant/textStyles.dart';
import '../../../courses/presentation/widgets/courseSmallCard.dart';
import '../../data/models/professor/professor.dart';
import '../widgets/professorLargeCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfessorDetailsView extends StatelessWidget {
  late AppLocalizations appLocalizations;
  final Professor professor;
   ProfessorDetailsView({Key? key, required this.professor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: TitleBackAppBar(title: appLocalizations.bestProfessor,),
      body: SingleChildScrollView(
        child: Column(

          children: [
            ProfessorLargeCard(
              backgroundColor: AppColors.accent.withAlpha(60),
              professor: professor,


            ),
            Padding(

              padding:  EdgeInsets.symmetric(
                horizontal: LayoutHandler(context).mainHorizontalPadding(),
                vertical: 8
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appLocalizations.introViedo,
                    style: TextStyles.font18TxtBlack500,

                  ),
                  SizedBox(height: 8,),
                 VideoContainer(videoUrl: "ssss"),
                  SizedBox(height: 16,),
                  Text(
                    appLocalizations.courses,
                    style: TextStyles.font18TxtBlack500,

                  ),
                  SizedBox(height: 8,),
                  Container(

                    height: 280 ,

                    child: ListView.builder(
                      itemCount: 10,

                      scrollDirection: Axis.vertical,// Number of items in the list
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                          //  child: CourseSmallCard()
                          child: SizedBox(),

                        );

                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
