import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/loader.dart';
import 'package:nurse_space/feature/courses/presentation/manager/courseCubit.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/courseLargeCard.dart';

import '../../../../core/constant/textStyles.dart';
import '../../../search/presentation/widgets/searchBar.dart';
import '../../data/models/course/course.dart';
import '../widgets/courseSmallCard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyCoursesView extends StatelessWidget {
  MyCoursesView({Key? key}) : super(key: key);
  late LayoutHandler layoutHandler;
  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    layoutHandler = LayoutHandler(context);
    appLocalizations = AppLocalizations.of(context)!;
    //todo i here get all courses give the func the user id
   // context.read<CourseCubit>().getMyCourses(1);
    context.read<CourseCubit>().getAllCourses();

    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
             CustomSearchBar(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3,
                  horizontal: layoutHandler.mainHorizontalPadding()),
              child: Text(appLocalizations.courses,
                style: TextStyles.font18TxtBlack500,
        
              ),
            ),
            BlocBuilder<CourseCubit, CourseState>(
              builder: (context, state) {
                return state.when(
                    loading: (){
        
                      return const Column(
                        children: [
                          SizedBox(height: 200,),
                          Center(
                              child: Loader(showText: false,)
                          ),
                        ],
                      );
        
                    },
                    success: (courses){
                      List<Course>  myCourses = courses;
                      print("My Course ${myCourses.length}");
                     return Column(
                       children: myCourses.map((course) {
                         return Container(
                             margin: EdgeInsets.symmetric(vertical: 3,
                                 horizontal: layoutHandler.mainHorizontalPadding()),
                             child: CourseLargeCard(course: course,));
                       }).toList(),
        
                     );
        
                    },
                    error: (e){
                      return Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 70),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.not_interested_rounded,size: 200,color: Colors.grey.shade300,),
                                  Text(
                                      appLocalizations.noCourseForYou,
                                    style: TextStyles.font18TxtBlack500,
                                  )


                                ],
                              ),
                          ));
                    }, initial: () {
                      return SizedBox();
                }
        
        
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
