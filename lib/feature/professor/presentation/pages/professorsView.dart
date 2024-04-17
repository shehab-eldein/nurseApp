import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';

import '../../../../core/handlers/layoutHandler.dart';
import '../../../../core/widgets/titleBackAppBar.dart';
import '../../data/models/professor/professor.dart';
import '../widgets/professorLargeCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfessorsView extends StatelessWidget {
  final List<Professor> professors;

  late AppLocalizations appLocalizations;

   ProfessorsView({Key? key, required this.professors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: TitleBackAppBar(title: appLocalizations.bestProfessor,),
      backgroundColor: AppColors.greyBackground,
      body: ListView.builder(
        itemCount: professors.length,
        padding: EdgeInsets.symmetric(
           // horizontal: LayoutHandler(context).mainHorizontalPadding()
        ),

        scrollDirection: Axis.vertical,// Number of items in the list
        itemBuilder: (BuildContext context, int index) {
          return ProfessorLargeCard(
            professor: professors[index],

          );

        },
      ),
    );
  }
}
