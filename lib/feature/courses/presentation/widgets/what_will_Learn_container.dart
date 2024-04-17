import 'package:flutter/cupertino.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constant/textStyles.dart';

class WhatWillLearnContainer extends StatelessWidget {
  
 final List<String> learnList;
 final AppLocalizations appLocalizations;
   WhatWillLearnContainer({
     super.key,
     required this.learnList,
     required this.appLocalizations});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocalizations.courseWillLearn,
          style: TextStyles.font18TxtBlack500,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,

        ),
        const SizedBox(height: 8,),
        Column(

            children: learnList.map((learn) {

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8 ),
            child: WidgetTextRow(
              mainAxisAlignment: MainAxisAlignment.start,
                myWidget: Image.asset(
                    ImagesManager.dot,
                  height: 20,
                ),
                txt: learn,
                textColor: AppColors.textDark,
              iconFirst: true,
              textStyle: TextStyles.font18TxtLightGrey500,

            ),
          );
        }).toList()),
      ],
    );
  }
}
