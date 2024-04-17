import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/language/presentation/manager/languageBloc.dart';
import 'package:nurse_space/core/navigation/rootNavigation.dart';
import 'package:nurse_space/feature/places/presentation/pages/countryAndUniverstyView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/expertView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/languageAndTypeView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/loginView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/signUpView.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nurse_space/feature/search/data/repositories/search_repo.dart';
import 'core/language/presentation/manager/languageState.dart';
import 'core/navigation/appRouter.dart';
import 'core/navigation/navigationCubit.dart';
import 'core/navigation/routes.dart';
import 'feature/auth/presentation/pages/splashView.dart';
import 'feature/search/data/data_sources/search_remote_data_source.dart';
import 'feature/search/presentation/manager/search_cubit.dart';


class NurseSpaceAcademyApp extends StatelessWidget {
  const NurseSpaceAcademyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (_) => LanguageBloc(),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(searchRepo: SearchRepo(searchRemoteDataSource: SearchRemoteDataSource())),
        ),
        BlocProvider(
          create: (_) => NavigationCubit(),
        ),


      ],

      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter().generateRoute,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.languageCode),


          );
        },
      ),);
  }
}