import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/handlers/layoutHandler.dart';
import '../../../../core/widgets/widgetTextRow.dart';

class ProfileCard extends StatelessWidget {

  String title;
  String value;
  IconData iconData;
   ProfileCard({
    Key? key,
    required this.iconData,
     required this.value,
     required this.title,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8,),
        Padding(

          padding:EdgeInsets.symmetric(
              horizontal: LayoutHandler(context).mainHorizontalPadding()),                child: Row(
          children: [

            WidgetTextRow(
              myWidget: Icon(
                iconData,
                color: AppColors.accent,
                size: 20,
              ),
              txt: title,
              textColor: AppColors.primary,
              iconFirst: true,
              textSize: 18,
              textStyle: TextStyles.font18Primary600,
              txtConatinerwidth: 130,
            ),
            Spacer(),
            WidgetTextRow(
              myWidget: Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.accent,
                size: 20,
              ),
              txt: value,
              textColor: AppColors.primary,
              iconFirst: false,
              textSize: 15,
              spaceBetween: 8,
            ),
          ],
        ),
        ),
        SizedBox(height: 8,),

        Divider(thickness: 0.5,color: AppColors.accent,)
      ],
    );
  }
}
