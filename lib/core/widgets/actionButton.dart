import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'iconTextRow.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final VoidCallback onTap;


  const ActionButton({
    Key? key,
    required this.text,
     this.icon,
     this.iconColor,
    required this.textColor,
    required this.buttonColor,
    required this.borderColor,
    required this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,




      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16), // Adjust padding as needed
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: borderColor,width: 1.5), // Set border color
        ),
      ),


      child: Container(
       height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconTextRow(
              icon: icon,
              iconColor: iconColor,
              textColor: textColor,
              txt: text,
            ),
          ],
        ),
      ),
    );
  }
}

