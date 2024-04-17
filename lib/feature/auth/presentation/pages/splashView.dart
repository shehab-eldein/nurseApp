import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/constant/textStyles.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/actionButton.dart';
import 'package:nurse_space/core/widgets/iconTextRow.dart';
import 'package:nurse_space/feature/auth/presentation/pages/signUpView.dart';

import '../../../../core/managers/sf_manager.dart';
import '../../../../core/model/user_model/user.dart';
import '../../../../core/navigation/routes.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // SFManager().saveUser(User(name: "shehabSFF", email: "ShehabSF@a.com"));

    SFManager().getUser();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),

            Align(
              alignment: Alignment.topLeft,
                child: Image.asset(ImagesManager.splashBackground1)
            ),

            Image.asset(ImagesManager.appLogo,height: 200,width: 180
                ,fit: BoxFit.cover,),

            Text
              ("أكاديمية مساحة ممرض",
              style: TextStyles.font22Accent600,

            ),
            Text
              ("اكتشف محتوى تعليمي رائع وطور مهاراتك الطبية اليوم",
              style: TextStyles.font16Grey400,

            ),
            SizedBox(height: 30,),

            Align(
              alignment: Alignment.topRight,
                child: Image.asset(ImagesManager.splashBackground2)

            ),
            SizedBox(height: 135),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: LayoutHandler(context).mainHorizontalPadding()),
              child: ActionButton(

                  text: "تسجيل الدخول",
                  icon: Icons.lock_outline,
                  iconColor: AppColors.primary,
                  textColor: AppColors.primary,
                  buttonColor: Colors.white,
                  borderColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      Routes.login,
                    );

                  }),
            ),
            SizedBox(height: 16,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3,
                  horizontal: LayoutHandler(context).mainHorizontalPadding()),
              child: ActionButton(

                  text: " إنشاء حساب",
                  icon: Icons.person_add_alt,
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  buttonColor: AppColors.primary,
                  borderColor: Colors.white,
                  onTap: () {
                    // context.navigateTo(SignUpView());
                    Navigator.of(context).pushReplacementNamed(
                      Routes.register,
                    );

                  }),
            ),




          ],
        ),
      ),
    );
  }
}
