
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';
import 'package:nurse_space/core/handlers/ValidatorHandler.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/feature/auth/presentation/pages/languageAndTypeView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/loginView.dart';
import 'package:nurse_space/feature/auth/presentation/widgets/authTextField.dart';
import 'package:nurse_space/feature/auth/presentation/widgets/passTextField.dart';
import 'package:nurse_space/feature/auth/presentation/widgets/phoneTextField.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/model/user_model/user.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/widgets/actionButton.dart';
import '../../../../core/widgets/loader.dart';
import '../manager/authCubit.dart';
import '../widgets/conitnueWithContainer.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  late TextEditingController nameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passTextEditingController;
  late TextEditingController phoneTextEditingController;
  late ValidatorHandler validatorHandler;


  void validateInput(BuildContext buildContext) {
    final validateName = validatorHandler.validateName(
        nameTextEditingController.text.trim());
    final validatePass = validatorHandler.validatePassword(
        passTextEditingController.text.trim());
    final validateEmail = validatorHandler.validateEmail(
        emailTextEditingController.text.trim());
    final validatePhone = validatorHandler.validateNumber(
        phoneTextEditingController.text.trim());


    if (validateName != null) {
      buildContext.showCustomSnackBar(
        text: validateName,
      );
      return;
    }
    if (validateEmail != null) {
      buildContext.showCustomSnackBar(
        text: validateEmail,
      );
      return;
    }

    if (validatePass != null) {
      buildContext.showCustomSnackBar(
        text: validatePass,
      );
      return;
    }
    if (validatePhone != null) {
      buildContext.showCustomSnackBar(
        text: validatePhone,
      );
      return;
    }


    buildContext.read<AuthCubit>().signup(
        User(
            name: nameTextEditingController.text.trim(),
            email: emailTextEditingController.text.trim(),
            password:  passTextEditingController.text.trim(),
            phone: phoneTextEditingController.text.trim(),
          roles: [0],
          userType: "Type",
          universityId: 0,
          cityId: 0,


        ));
  }

  @override
  Widget build(BuildContext context) {
    nameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passTextEditingController = TextEditingController();
    phoneTextEditingController = TextEditingController();
    validatorHandler = ValidatorHandler(context);


    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "إنشاء حساب",
          style: TextStyles.font22Accent600,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30,
            horizontal: LayoutHandler(context).mainHorizontalPadding()),
        child: Column(
          children: [
            AuthTextField(labelText: "الاسم",
              obscureText: false,
              hintText: "من فضلك ادخل الاسم هنا",
              controller: nameTextEditingController,

            ),
            const SizedBox(height: 16,),
            AuthTextField(labelText: "البريد الإلكتروني",
              obscureText: false,
              hintText: "من فضلك ادخل البريد الإلكتروني هنا",
              controller: emailTextEditingController,

            ),
            const SizedBox(height: 16,),
            PassTextField(
              labelText: "كلمة المرور",
              controller: passTextEditingController,
            ),
            const SizedBox(height: 16,),
            PhoneTextField(labelText: "رقم الجوال",
              controller: phoneTextEditingController,


            ),
            const SizedBox(height: 170,),

            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {

                state.whenOrNull(

                   success: (s){

                     WidgetsBinding.instance.addPostFrameCallback((_) {
                       // Check if the widget is still mounted before navigating
                       if (context != null ) {
                         context.popUpPage(LanguageAndTypeView(
                             user:
                             User(
                               name: nameTextEditingController.text.trim(),
                               email: emailTextEditingController.text.trim(),
                               password: passTextEditingController.text.trim(),
                               phone: phoneTextEditingController.text.trim(),

                             )
                         ));
                       }
                     });



                     return SizedBox();
                   },
                   error: (e){

                     WidgetsBinding.instance.addPostFrameCallback((_) {
                       // Check if the widget is still mounted before navigating
                       if (context != null ) {
                         context.showCustomSnackBar(text: e);
                       }
                     });

                   });
               return state is Loading ? Loader(showText: false,): ActionButton(text: "إنشاء حساب",
                   icon: Icons.person_add_alt,
                   iconColor: AppColors.primary,
                   textColor: AppColors.primary,
                   buttonColor: AppColors.accent,
                   borderColor: AppColors.accent,
                   onTap: () => validateInput(context)
               );
              },
            ),
            const SizedBox(height: 36,),
            ContinueWithContainer(isLogin: false,),


          ],
        ),
      ),
    );
  }
}
