import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nurse_space/core/constant/appColors.dart';

class PhoneTextField extends StatefulWidget {
  final String countryCode;
  final String labelText;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final TextEditingController? controller;

  PhoneTextField({
    Key? key,
    required this.labelText,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.controller,
    this.countryCode = '+1',
  }) : super(key: key);

  @override
  _PhoneTextFieldState createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              fontSize: 17,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 48,

            alignment: Alignment.topCenter,
            color: Colors.white,


            child: Directionality(
              textDirection: TextDirection.ltr,
              child: IntlPhoneField(


               // enabled: false ,




                disableAutoFillHints: true,
                disableLengthCheck: true,
                keyboardType: TextInputType.number,
                invalidNumberMessage: AppLocalizations.of(context)!.invalid,
                pickerDialogStyle: PickerDialogStyle(
                    searchFieldCursorColor: AppColors.primary,
                    searchFieldInputDecoration: InputDecoration(
                  focusColor: AppColors.primary,
                  labelStyle: TextStyle(

                    fontSize: 17,
                    color: Colors.white,
                    backgroundColor: Colors.white
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.textLight,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                )),
                textAlign: TextAlign.left,
                dropdownIcon: Icon(Icons.arrow_drop_down_outlined,color: AppColors.primary,),
                textAlignVertical: TextAlignVertical.top,
                textInputAction: TextInputAction.done,
                cursorColor: AppColors.primary,
                cursorHeight: 17,
                decoration: InputDecoration(
                  focusColor:AppColors.primary,
                  labelStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: AppColors.lightBlue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.primary ),
                  ),

                ),
                controller: widget.controller,
                languageCode: "ar",
                onChanged: (phone) {
                 // onChanged?(phone.completeNumber) ?? null;
                },
                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
                onSaved: (phone) {
                  widget.onEditingComplete!();
                },
                initialCountryCode: "SA",


              ),
            ),
          ),

        ],
      ),
    );
  }
}
