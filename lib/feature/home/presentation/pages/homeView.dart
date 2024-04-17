import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/constant/textStyles.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/language/presentation/manager/languageBloc.dart';
import 'package:nurse_space/core/language/presentation/manager/languageState.dart';
import 'package:nurse_space/core/widgets/errorWidget.dart';
import 'package:nurse_space/core/widgets/iconTextRow.dart';
import 'package:nurse_space/core/widgets/loader.dart';
import 'package:nurse_space/core/widgets/typeCard.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/courses/presentation/manager/courseCubit.dart';
import 'package:nurse_space/feature/courses/presentation/pages/allCoursesView.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/courseSmallCard.dart';
import 'package:nurse_space/feature/home/presentation/widget/home_categories_container.dart';
import 'package:nurse_space/feature/home/presentation/widget/home_professor_container.dart';
import 'package:nurse_space/feature/professor/presentation/pages/professorsView.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../core/enums/navBarItem.dart';
import '../../../../core/navigation/navigationCubit.dart';
import '../../../categories/data/models/category/category.dart';
import '../../../categories/presentation/manager/categoriesCubit.dart';
import '../../../courses/presentation/widgets/coursesSmallShimmer.dart';
import '../../../professor/data/models/professor/professor.dart';
import '../../../professor/presentation/manager/professor_cubit.dart';
import '../../../professor/presentation/widgets/professorHomeCard.dart';
import '../../../search/presentation/widgets/searchBar.dart';
import '../widget/homeShimmer.dart';
import '../widget/viewAllRow.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  late LayoutHandler layoutHandler;

  List<Course> coursesList = [];

  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    layoutHandler = LayoutHandler(context);
    context.read<CategoriesCubit>().getAllCategories();
    context.read<ProfessorCubit>().getAllProfessors();
    context.read<CourseCubit>().getAllCourses();
    appLocalizations = AppLocalizations.of(context)!;
    final language = context.read<LanguageBloc>().state.languageCode;

    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearchBar(),

            HomeCategoriesContainer(),
            HomeProfessorContainer(),

            Container(
                margin: EdgeInsets.only(top: 16),
                child: BlocBuilder<CourseCubit, CourseState>(
                  builder: (context, state) {
                    return state.when(loading: () {
                      return CoursesSmallShimmer();
                    }, success: (courses) {
                      coursesList = courses;

                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    layoutHandler.mainHorizontalPadding()),
                            child: ViewAllRow(
                              title: appLocalizations.latestCourse,
                              onViewAllTap: () {
                                context.popUpPage(AllCoursesView(
                                  courses: coursesList,
                                ));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Column(
                              children: coursesList.map((course) {
                            return Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 10),
                                child: CourseSmallCard(course: course));
                          }).toList())
                        ],
                      );
                    }, error: (e) {
                      // return CustomErrorWidget(errorMessage: e);
                      return SizedBox();
                    }, initial: () {
                      return SizedBox();
                    });
                  },
                )),
          ],
        ),
      ),
    );
  }
}
