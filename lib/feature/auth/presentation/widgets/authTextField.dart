import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function()? onEditeComplete;
  final bool obscureText;
  final TextEditingController? controller;
  final Color? hintColor;
  final Color? borderColor;
  final bool error;
   final VoidCallback? onTape;
   final bool readOnly;


  const AuthTextField({
    Key? key,
     this.hintText,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    required this.obscureText,
    this.controller,
    this.onEditeComplete,
    this.hintColor,
    this.borderColor,
    this.error = false,
    this.onTape,
    this.readOnly = false


  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
        labelText,

        style: TextStyle(
          fontSize: 16,

          color: AppColors.primary,
          fontWeight: FontWeight.w600
        ),
      ),
        SizedBox(height: 8),
        Container(
          height: 48,
          color: Colors.white,
          child: TextField(
            readOnly: readOnly ,
            textAlignVertical: hintText!= null ?  TextAlignVertical.bottom : TextAlignVertical.top,
              textInputAction: TextInputAction.done,
              onTap: onTape,
              onEditingComplete: onEditeComplete ?? () {

                FocusScope.of(context).unfocus();
              },
              cursorColor: AppColors.primary,
              cursorHeight: 17,
            keyboardType: TextInputType.multiline,
              onChanged: onChanged,
              obscureText: obscureText,
              decoration: InputDecoration(
                suffixIcon: readOnly ? Icon(Icons.keyboard_arrow_down_outlined) :null,

                hintText: hintText ,
                hintStyle: TextStyle(
                    color:error ? AppColors.red : Colors.grey.shade300
                ),
                focusColor: error ? AppColors.red :AppColors.primary ,
                //labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(color:error ? AppColors.red : AppColors.lightBlue), // Border color when not focused
                ),


                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: error ? AppColors.red : AppColors.primary), // Set the focused border color
                ),

              ),
              controller: controller ,
            ),
        )

        ],
      ),
    );
  }
}