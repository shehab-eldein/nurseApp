import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/widgets/circleIconButton.dart';

import '../constant/appColors.dart';
import '../constant/textStyles.dart';
import '../handlers/layoutHandler.dart';

class TitleBackAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  TitleBackAppBar( {super.key,required this.title,});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      centerTitle: false,
      leading: Container(
        alignment: AlignmentDirectional.centerStart,

        padding: EdgeInsets.symmetric(horizontal: LayoutHandler(context).mainHorizontalPadding()),
        child: Text (

          title,
          style: TextStyles.font22Accent600,

        ),
      ),
      leadingWidth: 220,
      actions: [

        CircleIconButton(
            iconData: Icons.arrow_forward_outlined,
            onPressed: () {
              Navigator.of(context).pop();
            })

      ],
    );
  }
}