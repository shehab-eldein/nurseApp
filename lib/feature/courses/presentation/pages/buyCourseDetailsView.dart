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

class BuyCourseDetailsView extends StatelessWidget {
  Course course;

  BuyCourseDetailsView({Key? key, required this.course}) : super(key: key);

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
                  imageUrl: course.media.isNotEmpty
                      ? course.media[0].preview ?? ""
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              language == "ar"
                                  ? course.courseName['ar'] ?? ""
                                  : course.courseName['en'] ?? "",
                              style: TextStyles.font28TxtBlack500,
                            ),
                          ),
                          CircleIconButton(
                              iconData: CupertinoIcons.bookmark,
                              elevate: true,
                              containerSize: 35,
                              iconSize: 20,
                              onPressed: () {}),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            appLocalizations.coursePrice,
                            style: TextStyles.font18TxtLightGrey500,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            course.coursePrice ?? "0.0",
                            style: TextStyles.font28TxtLightGreen600,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            appLocalizations.currencyCode,
                            style: TextStyles.font18TxtLightGrey500,
                          ),
                        ],
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
                            txt: " ${course.stats?["students"] ?? "0" } ${ appLocalizations.student}",
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
                            txt: "${course.stats?["videos"] ?? "0" } ${appLocalizations.video}",
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
                            txt: "${course.stats?["files"] ?? "0" } ${appLocalizations.files}",
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
                              professor: course.professor!));
                        },
                        child: Row(
                          children: [
                            course.professor == null
                                ? const Text("no available info for profssor.")
                                : WidgetTextRow(
                                    myWidget: course
                                            .professor!.media.isNotEmpty
                                        ? CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 22,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    course.professor!.media[0]
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
                                    txt: course.professor?.name ?? "",
                                    textColor: AppColors.textMedium,
                                    iconFirst: true,
                                    textSize: 12,
                                  ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        appLocalizations.courseIntro,
                        style: TextStyles.font18TxtBlack500,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      //todo get url from object
                      VideoContainer(
                          videoUrl:
                              "https://app.nurse-space.com/storage/33/660ac6f0515a7_2550149143272270178.MOV"),
                      const SizedBox(
                        height: 16,
                      ),

                      // course.userLearn != null &&
                      //         course.userLearn!['ar']!.isNotEmpty
                      //     ? WhatWillLearnContainer(
                      //         appLocalizations: appLocalizations,
                      //         learnList: language == "ar"
                      //             ? course.userLearn!["ar"]!
                      //             : course.userLearn!["en"]!):
                                  const SizedBox(),
                      const SizedBox(
                        height: 16,
                      ),

                      BlocBuilder<CourseCubit, CourseState>(
                        builder: (context, state) {
                          state.whenOrNull(success: (url) async {
                            List<String> urls = url;

                            if (await canLaunchUrlString(urls[0])) {
                              await launchUrlString(urls[0]);
                            } else {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                // Check if the widget is still mounted before navigating
                                if (context != null) {
                                  context.showCustomSnackBar(
                                      text: appLocalizations.gatWayError);
                                }
                              });
                            }
                          });

                          return state is Loading
                              ? const Center(
                                  child: Loader(
                                  showText: false,
                                ))
                              : ActionButton(
                                  text: appLocalizations.subscribe,
                                  icon: Icons.airplane_ticket_outlined,
                                  iconColor: Colors.white,
                                  textColor: Colors.white,
                                  buttonColor: AppColors.textLight,
                                  borderColor: AppColors.textLight,
                                  onTap: () {
                                    context
                                        .read<CourseCubit>()
                                        .checkOut(course.id!);
                                  });
                        },
                      ),
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
