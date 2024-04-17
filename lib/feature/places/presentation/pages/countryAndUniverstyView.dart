import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';
import 'package:nurse_space/core/navigation/routes.dart';
import 'package:nurse_space/core/widgets/circleIconButton.dart';
import 'package:nurse_space/core/widgets/loader.dart';
import 'package:nurse_space/core/widgets/titleBackAppBar.dart';
import 'package:nurse_space/feature/auth/data/data_sources/authRemoteDataSource.dart';
import 'package:nurse_space/feature/auth/data/repositories/authRepo.dart';
import 'package:nurse_space/feature/auth/presentation/widgets/authTextField.dart';
import 'package:nurse_space/feature/places/presentation/manager/placesCubit.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/imagesManager.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/handlers/layoutHandler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/language/presentation/manager/languageState.dart';
import '../../../../core/model/name_id_model/nameIdModel.dart';
import '../../../../core/model/user_model/user.dart';
import '../../data/models/city/city.dart';
import '../../data/models/univeristy/univeristy.dart';
import '../widgets/placesBottomSheet.dart';

class CountryAndUniversityView extends StatelessWidget {
  final User user;
  late AppLocalizations appLocalizations;
  late TextEditingController regionEditTextController;
  late TextEditingController universityEditTextController;

  int cityId = 0;
  int univeristyId= 0;


  CountryAndUniversityView({Key? key, required this.user}) : super(key: key);


  void validateSignUp(){
    //////
  }
  void showCustomBottomSheet<T>(BuildContext context, List<NameId> data, bool isCity){

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return AuthBottomSheet(
          title: isCity ? appLocalizations.region: appLocalizations.university ,
          dataList: data,

          onOptionSelected: (nameId) {

           if (isCity){

             regionEditTextController.text = nameId.name;
             cityId = nameId.id;
           }else {
             universityEditTextController.text = nameId.name;
             univeristyId = nameId.id;
           }




            print("The Choice is ${nameId.name}");

          },
          selectedOption: isCity
              ? regionEditTextController.text
              : universityEditTextController
              .text,


        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    regionEditTextController = TextEditingController();
    universityEditTextController = TextEditingController();
   appLocalizations = AppLocalizations.of(context)!;

   // context.read<AuthCubit>()
   //     .getCityList();





    return Scaffold(
      appBar: TitleBackAppBar(
        title: appLocalizations.university,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: LayoutHandler(context).mainHorizontalPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                if (state.languageCode == "ar"){
                  return Center(child: Image.asset(ImagesManager.progressBar_3));

                }else{
                  return Center(child: Image.asset(ImagesManager.progressBar_3_en));

                }

              },
            ),

            SizedBox(
              height: 16,
            ),
            BlocBuilder<PlacesCubit, PlacesState>(
              builder: (context, state) {






                if (state is Error){
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // Check if the widget is still mounted before navigating
                    if (context != null ) {
                      context.showCustomSnackBar(text: state.errorMessage);

                    }

                  });

                }



                return Column(
                  children: [
                    AuthTextField(
                      labelText: appLocalizations.region,
                      readOnly: true,
                      controller: regionEditTextController,


                      obscureText: false,
                      hintText: "من فضلك اختر المدينة التي تدرس بها",
                      onTape: () {
                        context.read<PlacesCubit>().getCityList();
                        print("Tapped");

                        if( state is LoadedCity){
                          print("enter Succcccccccc");
                          showCustomBottomSheet(
                              context,
                              state.cities.map((city) {
                                return NameId(id: city.id ?? 0, name: city.city ?? "No city name");
                              }).toList()
                              , true);


                        }

                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthTextField(
                      labelText: appLocalizations.university,
                      obscureText: false,
                      hintText: "من فضلك اختر الجامعة التي تدرس بها",
                      controller: universityEditTextController,
                      readOnly: true,
                      onTape: () {
                        context.read<PlacesCubit>().getUniversityList();
                        if( state is LoadedUniviristies){


                            showCustomBottomSheet(
                                context,
                                state.universities.map((university) {
                                  return NameId(id: university.id ?? 0, name: university.name ?? "No university name");
                                }).toList()
                                , false);





                        }

                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    state is Loading ? Loader() :TextButton(
                      onPressed: () {

                        if (universityEditTextController.text.isEmpty ||
                            regionEditTextController.text.isEmpty) {
                          context.showCustomSnackBar(
                              text: appLocalizations.enterEmptyFilled
                          );
                          return;
                        } else {

                          //Todo:- Update user Data
                            Navigator.pushReplacementNamed(
                                context, Routes.home);


                        }




                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16), // Adjust padding as needed
                        backgroundColor: AppColors.accent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(
                              color: AppColors.accent), // Set border color
                        ),
                      ),
                      child: Container(
                        height: 48,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            appLocalizations.signUp,
                            style:  TextStyles.font18TxtLightWhite500,
                          ),
                        ),
                      ),
                    ),


                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
