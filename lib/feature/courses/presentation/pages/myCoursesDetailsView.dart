import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/extensions/snackBar.dart';
import 'package:nurse_space/core/widgets/actionButton.dart';
import 'package:nurse_space/core/widgets/circleIconButton.dart';
import 'package:nurse_space/core/widgets/loader.dart';
import 'package:nurse_space/core/widgets/titleBackAppBar.dart';
import 'package:nurse_space/core/widgets/video_container.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/courses/data/repositories/courseRepo.dart';
import 'package:nurse_space/feature/courses/presentation/manager/courseCubit.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/courseDetailsContainer.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/lessonsContainer.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/myCourseTabBar.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/tests_info_Container.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/what_will_Learn_container.dart';
import 'package:nurse_space/feature/professor/presentation/pages/professor_details_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/constant/textStyles.dart';
import '../../../../core/handlers/layoutHandler.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../data/data_sources/coursesRemotDataSource.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/pdf_viewr.dart';

class MyCourseDetailsView extends StatefulWidget {
  Course course;

  MyCourseDetailsView({Key? key, required this.course}) : super(key: key);

  @override
  State<MyCourseDetailsView> createState() => _MyCourseDetailsViewState();
}

class _MyCourseDetailsViewState extends State<MyCourseDetailsView>with TickerProviderStateMixin {

  late TabController tabController;



  @override
  void initState() {

    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final appLocalizations = AppLocalizations.of(context)!;
    final language = context.read<LanguageBloc>().state.languageCode;

    return RepositoryProvider(
      create: (context) =>
          CourseRepo(coursesRemoteDataSource: CoursesRemoteDataSource()),
      child: BlocProvider(
        create: (context) =>
            CourseCubit(courseRepo: context.read<CourseRepo>()),
        child: Scaffold(
          appBar: TitleBackAppBar(
            title: appLocalizations.courses,
          ),
          backgroundColor: AppColors.greyBackground,
          body: SingleChildScrollView(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.course.media.isNotEmpty
                      ? widget.course.media[0].preview ?? ""
                      : "",
                  height: 150,
                  width: context.screenWidth,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    ImagesManager.placeholder,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal:
                      LayoutHandler(context).mainHorizontalPadding()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(

                        child: Text(
                          language == "ar"
                              ? widget.course.courseName['ar'] ?? ""
                              : widget.course.courseName['en'] ?? "",
                          style: TextStyles.font28TxtBlack500,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const WidgetTextRow(
                            myWidget: Icon(
                              Icons.star_border_purple500_sharp,
                              size: 20,
                              color: AppColors.accent,
                            ),
                            txt: "0",
                            textColor: AppColors.textGreyHintColor,
                            iconFirst: true,
                            spaceBetween: 3,
                            txtConatinerwidth: 50,
                          ),
                          WidgetTextRow(
                            myWidget: const Icon(
                              Icons.supervisor_account_outlined,
                              size: 20,
                              color: AppColors.accent,
                            ),
                            txt: " ${widget.course.stats?["students"] ?? "0" } ${ appLocalizations.student}",
                            textColor: AppColors.textGreyHintColor,
                            iconFirst: true,
                            spaceBetween: 3,
                            txtConatinerwidth: 90,
                          ),
                          WidgetTextRow(
                            myWidget: const Icon(
                              Icons.play_circle_outline,
                              size: 20,
                              color: AppColors.accent,
                            ),
                            txt: "${widget.course.stats?["videos"] ?? "0" } ${appLocalizations.video}",
                            textColor: AppColors.textGreyHintColor,
                            iconFirst: true,
                            spaceBetween: 3,
                            txtConatinerwidth: 70,
                          ),
                          WidgetTextRow(
                            myWidget: const Icon(
                              Icons.file_copy_outlined,
                              size: 20,
                              color: AppColors.accent,
                            ),
                            txt: "${widget.course.stats?["files"] ?? "0" } ${appLocalizations.files}",
                            textColor: AppColors.textGreyHintColor,
                            iconFirst: true,
                            spaceBetween: 3,
                            txtConatinerwidth: 70,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.popUpPage(ProfessorDetailsView(
                              professor: widget.course.professor!));
                        },
                        child: Row(
                          children: [
                            widget.course.professor == null
                                ? const Text("no available info for profssor.")
                                : WidgetTextRow(
                              myWidget: widget.course
                                  .professor!.media.isNotEmpty
                                  ? CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 22,
                                backgroundImage:
                                CachedNetworkImageProvider(
                                    widget.course.professor!.media[0]
                                        .preview ??
                                        ''),
                              )
                                  : const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 22,
                                backgroundImage: AssetImage(
                                    ImagesManager
                                        .doctorPlaceHolder),
                              ),
                              txt: widget.course.professor?.name ?? "",
                              textColor: AppColors.textMedium,
                              iconFirst: true,
                              textSize: 12,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),

                      MyCourseTabBar(
                          tabController: tabController,
                          items: [appLocalizations.details,appLocalizations.lesson,appLocalizations.exams]
                      ),
                      Container(
                        height: 500,
                        child: TabBarView(
                          controller: tabController,
                          physics: const NeverScrollableScrollPhysics(),

                          children: [
                           CourseDetailsContainer(course: widget.course, appLocalizations: appLocalizations),
                            LessonsContainer(lessons: widget.course.lessons),
                           TestsInfoContainer(testInfoList: widget.course.testsInfoList)


                          ],
                        ),
                      )


,


                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
