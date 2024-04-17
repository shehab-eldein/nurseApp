import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/feature/auth/presentation/pages/expertView.dart';

import '../../../../core/constant/textStyles.dart';


class EvaluationCard extends StatelessWidget {

  IconData iconData;
  String title;
  String subTitle;
  double width;

  EvaluationCard({Key? key,
    required this.iconData,
    required this.title,
    required this.width,
    required this.subTitle,






  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        height:  72,
        width: width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white, // Set your background color
          borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 0.2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4),
             decoration: BoxDecoration(
               color: AppColors.accent.withAlpha(50),
               borderRadius: BorderRadius.circular(6)
             ),
                child: Icon(iconData,color: AppColors.accent,)
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,

                  style: TextStyles.font22TxtDark600,

                ),
                Text(
                  subTitle,
                  style: TextStyles.font14TxtLightGrey500,

                ),
              ],
            ),
          ],
        ),
      ),
    )
    ;
  }
}
