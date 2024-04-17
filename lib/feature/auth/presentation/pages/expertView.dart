import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/widgets/titleBackAppBar.dart';
import 'package:nurse_space/feature/places/presentation/pages/countryAndUniverstyView.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/imagesManager.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/handlers/layoutHandler.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/language/presentation/manager/languageState.dart';
import '../../../../core/model/user_model/user.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/typeCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ExpertsView extends StatelessWidget {
  User user;
  late AppLocalizations appLocalizations;
   ExpertsView({Key? key,required this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:  TitleBackAppBar(
        title: appLocalizations.specialization,

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LayoutHandler(context).mainHorizontalPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 16,),
            BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                if (state.languageCode == "ar"){
                  return Center(child: Image.asset(ImagesManager.progressBar_2));

                }else{
                  return Center(child: Image.asset(ImagesManager.progressBar_2_en));

                }

              },
            ),

            SizedBox(height: 16,),
            Text(appLocalizations.whichSpecialization,
              style: TextStyles.font16TxtPrimary600,

            ),
            SizedBox(height: 16,),
        Container(
          height: 700,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 16.0, // Spacing between columns
              mainAxisSpacing: 16.0, // Spacing between rows
            ),
            itemCount: 6, // Total number of items
            itemBuilder: (context, index) {
              // Your item widget goes here
              return TypeCard(
                image: Image.asset(ImagesManager.book),
                title: "طالب",
                width: 150,
                height: 150,
                onTap: (){
                  //context.popUpPage(CountryAndUniversityView(user: user,));
                  Navigator.of(context).pushNamed(
                    Routes.places,
                    arguments: user,
                  );

                },
              );

            },
          ),
        ),

          ],
        ),

      ),
    );
  }
}
