import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/feature/profile/presentation/widgets/profileCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/constant/appColors.dart';
import '../../../../core/handlers/layoutHandler.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/language/presentation/widgets/languageToggle.dart';
import '../../../../core/model/user_model/user.dart';
import '../../../../core/widgets/actionButton.dart';

class ProfileDataColumn extends StatelessWidget {

  final User user;
  const ProfileDataColumn({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;


    return Column(
      children: [
        SizedBox(height: 33,),
        Stack(
          textDirection:  context.
          read<LanguageBloc>().state.languageCode ==
              "ar" ? TextDirection.ltr
              :TextDirection.rtl,
          children: [
            ProfileCard(
              iconData: Icons.language,
              value: '',
              title: appLocalizations.language,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: LayoutHandler(context).mainHorizontalPadding()),
              child: LanguageToggle(),
            )
          ],
        ),

        ProfileCard(
          iconData: Icons.pin_drop_outlined,
          value: user.city ?? "No city",
          title: appLocalizations.region,),
        ProfileCard(
          iconData: Icons.account_balance_outlined,
          value: user.university ?? "No university",
          title: appLocalizations.university,),
        ProfileCard(
          iconData: Icons.school_outlined,
          value: user.team ?? "No Team",
          title: appLocalizations.field,),
        ProfileCard(
          iconData: Icons.category_outlined,
          value: user.userType ?? "No User type",
          title: appLocalizations.specialization,),
        ProfileCard(
          iconData: Icons.bookmarks_outlined,
          value: "Need backend filed",
          title: appLocalizations.courses,),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: LayoutHandler(context).mainHorizontalPadding()
          ),

        )

      ],
    );
  }
}
