import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Loader extends StatelessWidget {
  final bool showText;

  const Loader({Key? key, this.showText = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: AppColors.primary,
        ),
        SizedBox(height: 16),
        if (showText)
          Text(
            //AppLocalizations.of(context)!.loading,
            "Loading",
            style: TextStyle(color: AppColors.accent),
          ),
      ],
    );
  }
}