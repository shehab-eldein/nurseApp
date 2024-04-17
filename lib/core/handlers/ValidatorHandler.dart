import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';

class ValidatorHandler {
  final BuildContext context;

  ValidatorHandler(this.context);

  String? validateName(String? name) {
    if (name == null || !name.isValidName()) {
      return AppLocalizations.of(context)!.nameMustBe;
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || !email.isValidEmail()) {
      return AppLocalizations.of(context)!.emailMustBe;
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.length < 5) {
      return AppLocalizations.of(context)!.passMustBe;


    }
    return null;
  }


  String? validateNumber(String? number) {
    if (number == null || !number.isValidNumber() || number.length < 8) {
      return AppLocalizations.of(context)!.numberMustBe;


    }
    return null;
  }
}
