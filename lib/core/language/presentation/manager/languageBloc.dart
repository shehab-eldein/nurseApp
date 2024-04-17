import 'package:bloc/bloc.dart';

import 'languageEvent.dart';
import 'languageState.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState('ar')); // Set the default language

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is ChangeLanguageEvent) {
      yield LanguageState(event.languageCode);
    }
  }
}