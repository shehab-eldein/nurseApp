import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/language/presentation/manager/languageBloc.dart';
import 'package:nurse_space/core/language/presentation/manager/languageState.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../constant/appColors.dart';
import '../manager/languageEvent.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({Key? key}) : super(key: key);
  // context.read<LanguageBloc>().add(ChangeLanguageEvent("en"));
  // context.read<LanguageBloc>().add(ChangeLanguageEvent("ar"));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.read<LanguageBloc>().state.languageCode == "ar") {
           context.read<LanguageBloc>().add(ChangeLanguageEvent("en"));

        }else{
          context.read<LanguageBloc>().add(ChangeLanguageEvent("ar"));

        }
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
             if (state.languageCode == "ar" ) {
               return Image.asset(ImagesManager.langAr);
             }else {
               return Image.asset(ImagesManager.langEn);
             }

            },
          )),
    );
  }
}
