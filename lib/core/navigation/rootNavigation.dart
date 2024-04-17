import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/language/presentation/manager/languageBloc.dart';
import 'package:nurse_space/core/language/presentation/manager/languageState.dart';
import 'package:nurse_space/feature/courses/data/data_sources/coursesRemotDataSource.dart';
import 'package:nurse_space/feature/courses/data/repositories/courseRepo.dart';
import 'package:nurse_space/feature/courses/presentation/manager/courseCubit.dart';
import 'package:nurse_space/feature/courses/presentation/pages/myCoursesView.dart';
import 'package:nurse_space/feature/evaluation/presentation/pages/evaluationView.dart';
import 'package:nurse_space/feature/profile/presentation/pages/profileView.dart';
import '../../feature/home/presentation/pages/homeView.dart';
import '../../feature/categories/presentation/pages/categorisView.dart';
import '../enums/navBarItem.dart';
import 'navigationCubit.dart';
import 'navigationState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RootNavigation extends StatefulWidget {

  const RootNavigation({Key? key,}) : super(key: key);

  @override
  _RootNavigationState createState() => _RootNavigationState();

}

class _RootNavigationState extends State<RootNavigation> {
  late LayoutHandler layoutHandler;

  @override
  Widget build(BuildContext context) {
    layoutHandler = LayoutHandler(context);

    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {

        print("Lang Builder Callled ${state.languageCode}");

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            toolbarHeight: 50,
            elevation: 0,

            leading: Container(


                padding: EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: layoutHandler.mainHorizontalPadding()),


                child: Row(
                  children: [
                    Image.asset(ImagesManager.appIcon, height: 50,
                      width: 50,
                      fit: BoxFit.fitHeight,),

                    Text(AppLocalizations.of(context)!.welcome,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.accent
                      ),

                    ),
                  ],
                )

            ),
            leadingWidth: layoutHandler.valuesHandler(
                220, 220,
                326,
                320),
            actions: [

              // Container(
              //   margin: EdgeInsets.symmetric(
              //       horizontal: layoutHandler.mainHorizontalPadding()),
              //   child: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     radius: 16,
              //     child: Icon(
              //       Icons.notifications_none_sharp,
              //       color: AppColors.accent,
              //       size: 24,
              //     ),
              //   ),
              // )

            ],
          ),
          bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: state.index,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.primary,
                selectedItemColor: AppColors.accent,
                unselectedItemColor: Colors.white,
                //fixedColor: Colors.grey,

                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(ImagesManager.homeIcon),
                      size: 24,
                    ),
                    label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(ImagesManager.sectionIcon),
                      size: 24,
                    ),
                    label: AppLocalizations.of(context)!.sections,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(ImagesManager.coursesIcon),
                      size: 24,
                    ),
                    label: AppLocalizations.of(context)!.courses,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(ImagesManager.evaluationIcon),
                      size: 24,
                    ),
                    label: AppLocalizations.of(context)!.evaluation,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person),
                    label: AppLocalizations.of(context)!.profile,
                  ),
                ],
                onTap: (index) {
                  switch (index) {
                    case 0:
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.home, state.data);
                      break;
                    case 1:
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.sections, state.data);
                      break;
                    case 2:
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.courses, state.data);
                      break;
                    case 3:
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.evaluation, state.data);
                      break;
                    case 4:
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.profile, state.data);
                      break;
                  }
                },
              );
            },
          ),
          body: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                switch (state.navbarItem) {
                  case NavbarItem.home:
                    return HomeView();
                  case NavbarItem.sections:
                    return CategoriesView();
                  case NavbarItem.courses:
                    return MyCoursesView();
                  case NavbarItem.evaluation:
                    return EvaluationView();
                  case NavbarItem.profile:
                    return ProfileView();
                }
              }),
        );
      },
    );
  }
}
