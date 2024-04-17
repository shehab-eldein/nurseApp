import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/language/presentation/manager/languageBloc.dart';
import 'package:nurse_space/core/language/presentation/manager/languageState.dart';
import 'package:nurse_space/core/language/presentation/widgets/languageToggle.dart';
import 'package:nurse_space/core/widgets/titleBackAppBar.dart';
import 'package:nurse_space/core/widgets/topBar.dart';
import 'package:nurse_space/core/widgets/typeCard.dart';
import 'package:nurse_space/feature/auth/presentation/pages/expertView.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/textStyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/model/user_model/user.dart';


class LanguageAndTypeView extends StatelessWidget {
  User user;

  LanguageAndTypeView({Key? key, required this.user}) : super(key: key);
  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TitleBackAppBar(
        title: appLocalizations.qualification,


      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: LayoutHandler(context).mainHorizontalPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
            BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                if (state.languageCode == "ar"){
                  return Center(child: Image.asset(ImagesManager.progressBar_1));

                }else{
                  return Center(child: Image.asset(ImagesManager.progressBar_1_en));

                }

              },
            ),
            SizedBox(height: 16,),
            Text(
              appLocalizations.chooseLanguage,
              style: TextStyles.font16TxtPrimary600,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: LanguageToggle(),
            ),
            SizedBox(height: 16,),
            Align(child:
            Image.asset(ImagesManager.idea),
              alignment: Alignment.center,

            ),
            SizedBox(height: 70,),
            Text(appLocalizations.graduateOrStudent,
              style: TextStyles.font16TxtPrimary600,

            ),
            SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TypeCard(
                  image: Image.asset(ImagesManager.book),
                  title: appLocalizations.graduate,
                  width: context.screenWidth * 0.438,
                  height: context.screenWidth * 0.438,
                  onTap: () {
                    //add role
                    context.popUpPage(ExpertsView(user: user));
                  },

                ),
                TypeCard(
                  image: Image.asset(ImagesManager.graduate),
                  title: appLocalizations.student,
                  width: context.screenWidth * 0.438,
                  height: context.screenWidth * 0.438,
                  onTap: () {
                    print("tapped");


                    //add role
                    context.popUpPage(ExpertsView(user: user));
                  },

                ),
              ],
            ),


          ],
        ),

      ),
    );
  }
}
