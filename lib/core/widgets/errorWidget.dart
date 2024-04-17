import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';

import '../constant/textStyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomErrorWidget extends StatelessWidget {
  final String? errorMessage;
 const CustomErrorWidget({Key? key,this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  appLocalizations = AppLocalizations.of(context)!;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check if the widget is still mounted before navigating
      if (context != null ) {
        context.showCustomSnackBar(
         // text:errorMessage ?? "Cannot connect please Try Again",
          text: appLocalizations.errorGetData
        );
      }
    });
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [


     const Center(
    child: Icon(
      Icons.phonelink_erase_rounded,
      size: 100,
      color: Colors.grey,),
    ),
        SizedBox(
          width: 250,
          child: Text(
            appLocalizations.mainErrorMessage,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey

            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        )

      ],
    );
  }
}
