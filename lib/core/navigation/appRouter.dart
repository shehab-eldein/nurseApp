import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/navigation/rootNavigation.dart';
import 'package:nurse_space/core/navigation/routes.dart';
import 'package:nurse_space/feature/auth/data/data_sources/authRemoteDataSource.dart';
import 'package:nurse_space/feature/auth/data/repositories/authRepo.dart';
import 'package:nurse_space/feature/auth/di/auth_service.dart';
import 'package:nurse_space/feature/auth/presentation/manager/authCubit.dart';
import 'package:nurse_space/feature/auth/presentation/pages/languageAndTypeView.dart';
import 'package:nurse_space/feature/categories/di/categories_service.dart';
import 'package:nurse_space/feature/courses/di/courses_service.dart';
import 'package:nurse_space/feature/evaluation/di/evaluation_service.dart';
import 'package:nurse_space/feature/places/data/data_sources/placesRemoteDataSource.dart';
import 'package:nurse_space/feature/places/data/repositories/placesRepo.dart';
import 'package:nurse_space/feature/places/presentation/manager/placesCubit.dart';
import 'package:nurse_space/feature/places/presentation/pages/countryAndUniverstyView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/expertView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/loginView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/signUpView.dart';
import 'package:nurse_space/feature/auth/presentation/pages/splashView.dart';
import 'package:nurse_space/feature/categories/data/data_sources/categoriesRemoteDataSource.dart';
import 'package:nurse_space/feature/categories/data/repositories/categoriesRepo.dart';
import 'package:nurse_space/feature/categories/presentation/manager/categoriesCubit.dart';
import 'package:nurse_space/feature/evaluation/data/data_sources/evaluationRemoteDataSource.dart';
import 'package:nurse_space/feature/evaluation/data/models/evaluation.dart';
import 'package:nurse_space/feature/evaluation/data/repositories/evaluationRepo.dart';
import 'package:nurse_space/feature/evaluation/presentation/manager/evaluationCubit.dart';
import 'package:nurse_space/feature/professor/di/professor_service.dart';

import 'package:nurse_space/feature/profile/data/data_sources/profile_remote_dataSource.dart';
import 'package:nurse_space/feature/profile/data/repositories/profile_repo.dart';
import 'package:nurse_space/feature/profile/di/profile_service.dart';
import 'package:nurse_space/feature/profile/presentation/manager/profile_cubit.dart';
import 'package:nurse_space/feature/profile/presentation/widgets/profileCard.dart';

import '../../feature/courses/data/data_sources/coursesRemotDataSource.dart';
import '../../feature/courses/data/repositories/courseRepo.dart';
import '../../feature/courses/presentation/manager/courseCubit.dart';
import '../../feature/professor/data/repositories/professor_repo.dart';
import '../../feature/professor/presentation/manager/professor_cubit.dart';
import '../model/user_model/user.dart';

class AppRouter {
  AppRouter();

  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      // case '/':
      //   AuthService().initDi();
      //   return _buildPageRoute(
      //
      //       // builder: (_) => LanguageAndTypeView(user: User(name: 'shehab', email: 'a@a.com')));
      //       builder: (_) => SplashView());


      case Routes.register:
        return _buildPageRoute(builder: (context) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider<AuthRepo>(
                create: (context) => GetIt.I<AuthRepo>(),
              ),
            ],
            child: BlocProvider<AuthCubit>(
              create: (context) => GetIt.I<AuthCubit>(),
              // child: CountryAndUniversityView(user_model:settings.arguments as User),
              child: SignUpView(),
            ),
          );
        });
      case Routes.login:
        return _buildPageRoute(
          builder: (context) {
            return MultiRepositoryProvider(
              providers: [
                RepositoryProvider<AuthRepo>(
                  create: (context) => GetIt.I<AuthRepo>(),
                ),
              ],
              child: BlocProvider<AuthCubit>(
                create: (context) => GetIt.I<AuthCubit>(),
                child: LoginView(),
              ),
            );
          },
        );

      case Routes.places:
        GetIt.I.registerLazySingleton<PlacesRemoteDataSource>(
          () => PlacesRemoteDataSource(),
        );

        GetIt.I.registerLazySingleton<PlacesRepo>(
          () => PlacesRepo(
            placesRemoteDataSource: GetIt.I<PlacesRemoteDataSource>(),
          ),
        );

        GetIt.I.registerFactory<PlacesCubit>(
          () => PlacesCubit(placesRepo: GetIt.I<PlacesRepo>()),
        );

        return _buildPageRoute(
          builder: (context) {
            return MultiRepositoryProvider(
              providers: [
                RepositoryProvider<PlacesRepo>(
                  create: (context) => GetIt.I<PlacesRepo>(),
                ),
              ],
              child: BlocProvider<PlacesCubit>(
                create: (context) => GetIt.I<PlacesCubit>()..getCityList(),
                child: CountryAndUniversityView(
                  user: settings.arguments as User,
                ),
              ),
            );
          },
        );

      case Routes.home:
         case '/':

        ProfileService().initDi();
        CoursesService().initDi();
        EvaluationService().initDi();
        CategoriesService().initDi();
        ProfessorService().initDi();

        return _buildPageRoute(
            builder: (_) => MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider<CourseRepo>(
                      create: (context) => GetIt.I<CourseRepo>(),
                    ),
                    RepositoryProvider<CategoriesRepo>(
                      create: (context) => GetIt.I<CategoriesRepo>(),
                    ),
                    RepositoryProvider<ProfessorRepo>(
                      create: (context) => GetIt.I<ProfessorRepo>(),
                    ),
                    RepositoryProvider<EvaluationRepo>(
                      create: (context) => GetIt.I<EvaluationRepo>(),
                    ),
                    RepositoryProvider<ProfileRepo>(
                      create: (context) => GetIt.instance<ProfileRepo>(),
                    ),
                  ],
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider<CourseCubit>(
                        create: (context) => GetIt.I<CourseCubit>(),
                      ),
                      BlocProvider<CategoriesCubit>(
                        create: (context) => GetIt.I<CategoriesCubit>(),
                      ),
                      BlocProvider<ProfessorCubit>(
                        create: (context) => GetIt.I<ProfessorCubit>(),
                      ),
                      BlocProvider<EvaluationCubit>(
                        create: (context) => GetIt.I<EvaluationCubit>(),
                      ),
                      BlocProvider<ProfileCubit>(
                        create: (context) => GetIt.I<ProfileCubit>(),
                      ),
                    ],
                    child: const RootNavigation(),
                  ),
                ));

      default:
        return _buildPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }

  Route _buildPageRoute({
    required WidgetBuilder builder,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: builder,
          )
        : MaterialPageRoute(
            builder: builder,
          );
  }
}
