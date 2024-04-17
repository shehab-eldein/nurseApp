import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/appColors.dart';
import '../handlers/layoutHandler.dart';

class CircleIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final bool elevate;
  final double? containerSize;
  final double? iconSize;

  
   const CircleIconButton({
     Key? key,
     required this.iconData,
     required this.onPressed,
     this.elevate = false,
     this.containerSize,
     this.iconSize

   
   }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: LayoutHandler(context).mainHorizontalPadding()),
      child: Container(
        width: containerSize ?? 40,
        height: containerSize ?? 40,


        decoration: BoxDecoration(

          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: elevate ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 0.2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            )
          ] : []
        ),
        child: IconButton(
          icon: Icon(
            //todo: Check language
            iconData,
            color: AppColors.accent,
            size: iconSize ?? 20,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
