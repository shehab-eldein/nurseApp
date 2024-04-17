import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/actionButton.dart';
import 'package:nurse_space/core/widgets/errorWidget.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';
import 'package:nurse_space/core/language/presentation/widgets/languageToggle.dart';
import 'package:nurse_space/feature/profile/di/profile_service.dart';
import 'package:nurse_space/feature/profile/presentation/manager/profile_cubit.dart';
import 'package:nurse_space/feature/profile/presentation/pages/update_user_view.dart';
import 'package:nurse_space/feature/profile/presentation/widgets/profileCard.dart';
import 'package:nurse_space/feature/profile/presentation/widgets/profile_data_Column.dart';
import 'package:nurse_space/feature/profile/presentation/widgets/profile_info_card.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/constant/textStyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/loader.dart';


class ProfileView extends StatelessWidget {

  ProfileView({Key? key}) : super(key: key);
  late LayoutHandler layoutHandler;
  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    ProfileService().initDi();
    layoutHandler = LayoutHandler(context);
    appLocalizations = AppLocalizations.of(context)!;

    //todo get id from SF
    context.read<ProfileCubit>().getUser(id: 27);


    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: SingleChildScrollView(

        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.when(
                loading: () {
                  return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 250),
                      child: Loader()

                  );
                },
                loadedUser: (user) {
                  return Column(
                    children: [
                      ProfileInfoCard(
                        name: user.name,
                        phone: user.phone,
                        email: user.email,
                      ),
                      ProfileDataColumn(user: user,),
                      SizedBox(height: 32,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: layoutHandler
                                .mainHorizontalPadding()),
                        child: ActionButton(

                            text: appLocalizations.editInfo,
                            icon: Icons.mode_edit_outlined,
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            buttonColor: AppColors.textLight,
                            borderColor: AppColors.textLight,
                            onTap: () {

                              context.popUpPage(UpdateUserView());


                            }),
                      ),
                      SizedBox(height: 16,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: layoutHandler
                                .mainHorizontalPadding()),
                        child: ActionButton(
                          text: appLocalizations.logOut,
                          icon: Icons.logout_sharp,
                          iconColor: Colors.red,
                          textColor: Colors.red,
                          buttonColor: Colors.white,
                          borderColor: AppColors.red,
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(
                                Routes.login);
                          },),
                      ),

                    ],
                  );
                },
                error: (e) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (context != null) {
                      context.showCustomSnackBar(
                          text: e

                      );
                    }
                  });

                  return Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(vertical: 200),
                      child: CustomErrorWidget(errorMessage: e));
                });
          },
        ),
      ),
    );
  }
}
