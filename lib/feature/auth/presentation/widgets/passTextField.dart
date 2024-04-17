import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nurse_space/core/constant/appColors.dart';


class PassTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String labelText;
  final Function()? onEditeComplete;

  const PassTextField({
    Key? key,
    this.onChanged,
    this.controller,
    required this.labelText,
    this.onEditeComplete

  }) : super(key: key);

  @override
  _PassTextFieldState createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText ,

            style: TextStyle(
                fontSize: 17,
                color: AppColors.primary,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 8),
           Container(
             height: 48,
            color: Colors.white,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              cursorHeight: 17,
            textInputAction: TextInputAction.done,
            onEditingComplete: widget.onEditeComplete ,
            cursorColor: AppColors.primary, // Replace with your desired cursor color
            onChanged: widget.onChanged,
            obscureText: _obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: AppColors.lightBlue ), // Border color when not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              hintText: "من فضلك ادخل كلمة المرور هنا",
              hintStyle: TextStyle(
                  color: Colors.grey.shade300
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ?  Icons.visibility_off_outlined: Icons.visibility_outlined ,
                  color: AppColors.primary,
                  size: 18,// Replace with your desired icon color
                ),
                onPressed: _toggleObscureText,
              ),
              prefixIcon: Icon(Icons.lock_outline_rounded,size: 18,color: AppColors.lightBlue,)
            ),
            controller: widget.controller,
        ),
          )
        ],
      ),
    );
  }
}
