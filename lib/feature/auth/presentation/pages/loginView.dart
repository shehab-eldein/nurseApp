import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/constant/textStyles.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';
import 'package:nurse_space/core/handlers/ValidatorHandler.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/navigation/routes.dart';
import 'package:nurse_space/core/widgets/actionButton.dart';
import 'package:nurse_space/core/widgets/loader.dart';
import 'package:nurse_space/feature/auth/presentation/manager/authCubit.dart';
import 'package:nurse_space/feature/auth/presentation/pages/languageAndTypeView.dart';
import 'package:nurse_space/feature/auth/presentation/widgets/conitnueWithContainer.dart';
import 'package:nurse_space/feature/auth/presentation/widgets/passTextField.dart';

import '../widgets/authTextField.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LayoutHandler layoutHandler;
  late TextEditingController emailTextController;
  late TextEditingController passTextController;
  late ValidatorHandler validatorHandler;
  bool borderIsRed = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTextController.dispose();
    passTextController.dispose();

  }

  void validateLogin() {
    final validateName = validatorHandler.validateEmail(emailTextController.text.trim());
    final validatePass = validatorHandler.validatePassword(passTextController.text.trim());

    if ( validateName != null) {
      context.showCustomSnackBar(
          text: validateName,
        backgroundColor: AppColors.red,
        textColor: Colors.white
      );
      return;
    }

    if ( validatePass != null ){

      context.showCustomSnackBar(
          text: validatePass,
          backgroundColor: AppColors.red,
          textColor: Colors.white
      );
      return;
    }
    context.read<AuthCubit>().login(
        emailTextController.text.trim(),
        passTextController.text.trim()
    );


  }

  @override
  Widget build(BuildContext context) {
    layoutHandler = LayoutHandler(context);
    emailTextController = TextEditingController();
    passTextController = TextEditingController();
    validatorHandler = ValidatorHandler(context);

    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "تسجيل الدخول",
          style: TextStyles.font22Accent600,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: layoutHandler.mainHorizontalPadding()),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 20,),
              Image.asset(ImagesManager.appIcon, height: 75,
                width: 62,
                fit: BoxFit.fitHeight,),
              const SizedBox(height: 20,),
              Text("مرحبًا بك يسعدنا رؤيتك مجدداً!",
                style: TextStyles.font18TxtLightGrey500,),
              const SizedBox(height: 60,),
              AuthTextField(
                controller: emailTextController,
                labelText: 'البريد الإلكتروني',
                obscureText: false,
                hintText: "من فضلك ادخل بريدك الإلكتروني هنا",
                error: borderIsRed,

              ),
              const SizedBox(height: 16,),
               PassTextField(
                 controller: passTextController,
                   labelText: "كلمة المرور",
              ),
              const SizedBox(height: 16,),
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("هل نسيت كلمة المرور ؟",
                    style: TextStyles.font13TxtLightBlue600,)),
              const SizedBox(height: 36,),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {

                  if (state is Loading){
                   return const Loader(showText: false,);

                  }
                  else if (state is Success){
                    print("Enter Succ Scoop **___***");


                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      // Check if the widget is still mounted before navigating
                      if (context != null && mounted) {
                        Navigator.of(context).pushReplacementNamed(Routes.home);
                      }
                    });

                  } else if (state is Error){
                    print("Enter Error Scoop **___***");
                    print(state.errorMessage);

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      // Check if the widget is still mounted before navigating
                      if (context != null && mounted) {
                        context.showCustomSnackBar(
                            text: state.errorMessage,
                            backgroundColor: AppColors.red,
                            textColor: Colors.black
                        );
                      }
                    });


                   // Loader(showText: false,);
                  }

                 return ActionButton(
                    text: "تسجيل الدخول",
                    icon: Icons.lock_outline,
                    iconColor: AppColors.primary,
                    textColor: AppColors.primary,
                    buttonColor: AppColors.accent,
                    borderColor: AppColors.accent,
                    onTap: () => validateLogin(),
                  );


                },
              ),
              SizedBox(height: 36,),
              ContinueWithContainer(isLogin: true,),


            ],
          ),
        ),
      ),
    );
  }
}
