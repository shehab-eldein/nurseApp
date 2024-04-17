import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';

import '../../../../core/constant/textStyles.dart';

class ExamWidget extends StatefulWidget {
  final String question;
  final List<String> choices;
  final int correctIndex;

  const ExamWidget({
    Key? key,
    required this.question,
    required this.choices,
    required this.correctIndex,
  }) : super(key: key);

  @override
  _ExamWidgetState createState() => _ExamWidgetState();
}

class _ExamWidgetState extends State<ExamWidget> {
  int? selectedIndex;
  bool selectionEnabled = true; // Flag to track selection state

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
          horizontal: LayoutHandler(context).mainHorizontalPadding()

      ),
      color: AppColors.accent.withAlpha(70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style:TextStyles.font18Primary600,
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(widget.choices.length, (index) {
              return RadioListTile<int>(
                value: index,
                groupValue: selectedIndex,

                onChanged: selectionEnabled
                    ? (value) {
                  setState(() {
                    selectedIndex = value;
                    selectionEnabled = false; // Disable further selection
                  });
                }
                    : null, // Set onChanged to null when selection is disabled
                title: Text(
                  widget.choices[index],
                  style: TextStyle(
                    color: selectedIndex == index
                        ? (index == widget.correctIndex ? Colors.green : Colors.red)
                        : AppColors.textGreyHintColor,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,



              );
            }),
          ),
        ],
      ),
    );
  }
}
