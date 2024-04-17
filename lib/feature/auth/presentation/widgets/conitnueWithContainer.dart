import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nurse_space/core/constant/textStyles.dart';
import 'package:nurse_space/core/navigation/appRouter.dart';
import 'package:nurse_space/core/navigation/routes.dart';
import 'package:nurse_space/core/widgets/actionButton.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/imagesManager.dart';

class ContinueWithContainer extends StatelessWidget {
  bool isLogin;
   ContinueWithContainer({Key? key,required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

      child: GestureDetector(
        onTap: (){
          isLogin
              ? Navigator.pushReplacementNamed(context, Routes.register)
              : Navigator.pushReplacementNamed(context, Routes.login);


        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ليس لديك حساب؟",
              style: TextStyles.font16TxtLightGrey500,

            ),
            SizedBox(width: 5,),


            Container(

              height: 25,
              child: Text( isLogin? "إنشاء حساب" : "تسجيل الدخول",
                style: TextStyles.font16TxtLightBlue500,


              ),
            )

          ],
        ),
      ),
    );
  }
}
