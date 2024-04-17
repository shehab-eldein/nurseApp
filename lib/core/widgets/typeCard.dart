import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/feature/auth/presentation/pages/expertView.dart';

import '../constant/textStyles.dart';

class TypeCard extends StatelessWidget {

  Image image;
  String title;
  double width;
  double height;
  double? textHeight;
  double? radius;
   VoidCallback onTap;
   TypeCard({Key? key,
     required this.image,
     required this.title,
     required this.width,
     required this.height,
      this.radius,
    required this.onTap,
     this.textHeight



   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:  height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white, // Set your background color
          borderRadius: BorderRadius.circular(radius ?? 20), // Adjust border radius as needed
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 0.2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Container(
               child: image,

             height: 60,

           ),
            SizedBox(height: 8,),

            Container(

              margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
              alignment: Alignment.center,
              height: textHeight ?? 40,
              child: Text(
                title,
               textAlign: TextAlign.center,


                style: TextStyles.font14TxtPrimary600,

                maxLines: 2 ,
                overflow: TextOverflow.ellipsis,

              ),
            ),
          ],
        ),
      ),
    )
    ;
  }
}
