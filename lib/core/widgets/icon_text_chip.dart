import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';

import '../constant/appColors.dart';

class IconTextChip extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;

  final bool noIcon;

  const IconTextChip({
    super.key,
    required this.text,
     this.icon,
    this.backgroundColor,
     this.noIcon  = false,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(
          horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.lightBlue,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text,


            textAlign: TextAlign.end,
            style: TextStyle(
              color: textColor ?? AppColors.primary
            ),

          ),
          Visibility(
            visible: !noIcon,
            child: Row(
              children: [
                SizedBox(width: 4,),
                Icon(icon,size: 16, ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
