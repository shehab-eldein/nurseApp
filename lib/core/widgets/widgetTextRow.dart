import 'package:flutter/material.dart';

class WidgetTextRow extends StatelessWidget {
  final Widget myWidget;
  final String txt;
  final double? textSize;
  final Color textColor;
  final bool iconFirst;
  final double? txtConatinerwidth;
  final TextStyle? textStyle;
  final double? spaceBetween;
  final MainAxisAlignment? mainAxisAlignment;

  const WidgetTextRow({
    Key? key,
    required this.myWidget,
    required this.txt,
    this.textSize,
    required this.textColor,
    this.iconFirst = false,
    this.txtConatinerwidth,
    this.textStyle,
    this.spaceBetween,
    this.mainAxisAlignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconFirst
        ? Row(
      mainAxisAlignment: mainAxisAlignment ??
          MainAxisAlignment.center,
      children: [
        myWidget,
        SizedBox(width: spaceBetween ?? 8),
        Container(
          width: txtConatinerwidth ?? 120,
          child: Text(
            txt,
            style: textStyle ?? TextStyle(
              fontSize: textSize ?? 15,
              fontWeight: FontWeight.normal,
              color: textColor,
              overflow: TextOverflow.visible,
            ),
            maxLines: 1,
          ),
        ),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: txtConatinerwidth ?? null,
          child: Text(

            txt,
            style: textStyle ?? TextStyle(
              fontSize: textSize ?? 15,
              fontWeight: FontWeight.normal,
              color: textColor,
              overflow: TextOverflow.visible,
            ),
            maxLines: 1,
          ),
        ),
        SizedBox(width: spaceBetween ?? 3),
        myWidget,
      ],
    );
  }
}