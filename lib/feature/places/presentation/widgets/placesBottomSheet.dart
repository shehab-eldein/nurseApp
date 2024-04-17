import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/model/name_id_model/nameIdModel.dart';
import 'package:nurse_space/core/widgets/actionButton.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/textStyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class AuthBottomSheet<T> extends StatefulWidget {
  final Function(NameId) onOptionSelected;
  final String selectedOption;
  final String title;
  final List<NameId> dataList;


  AuthBottomSheet( {
    required this.onOptionSelected,
    super.key,
    required this.selectedOption,
    required this.title,
    required this.dataList,
    
  });

  @override
  _AuthBottomSheetState createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet> {
  int _selectedIndex = -1;
  late AppLocalizations appLocalizations;








@override
  void initState() {
  super.initState();




    _selectedIndex = findIndex(
        widget.dataList.map((s) {
          return s.name;
        }
        ).toList() , widget.selectedOption);
  }

  int findIndex(List<String> list, String searchString) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == searchString) {
        return i;
      }
    }
    return -1; // Return -1 if the string was not found
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;


    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      height: context.screenHeight *0.4,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyles.font18Primary600,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
        
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Icon(Icons.close,color: Colors.grey,)),
                ),
        
        
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.dataList[index].name),
        
                  leading: Radio(
                    fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.primary; // Color when radio is selected
                      }
                      return AppColors.lightBlue; // Color when radio is not selected
                    }),
                    value: index,
                    groupValue: _selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        _selectedIndex = value!;
                        widget.onOptionSelected(widget.dataList[index]);
                        Future.delayed(Duration(milliseconds: 300)).then((value) => {
                        Navigator.of(context).pop()
                        });

                      });

                    },
                  ),
                );
              },
            ),
            Row(
              children: [
        
              ],
            )
        
        
        
        
        
          ],
        ),
      ),
    );
  }
}