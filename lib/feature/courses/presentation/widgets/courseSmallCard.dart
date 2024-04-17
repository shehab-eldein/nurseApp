import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/icon_text_chip.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../pages/buyCourseDetailsView.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseSmallCard extends StatelessWidget {
  final Course course;



  const CourseSmallCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final language = context.read<LanguageBloc>().state.languageCode;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        context.popUpPage(BuyCourseDetailsView(
          course: course,
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow color
              spreadRadius: 0.2, // Spread radius
              blurRadius: 1, // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            ),
          ],
        ),
        child: Stack(
          textDirection:
              language == "en" ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl:course.media.isNotEmpty ?   course.media[0].url ?? "" : "",
                          height: 120,
                          width: LayoutHandler(context)
                              .valuesHandler(130, 108, 150, 150),
                          fit: BoxFit.fitHeight,
                          errorWidget: (context, url, error) => Container(
                            height: 120,
                            width: LayoutHandler(context)
                                .valuesHandler(130, 108, 150, 150),
                            child: Image.asset(
                              ImagesManager.placeholder,
                              fit: BoxFit.fitHeight,


                            ),
                          ),
                        )),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        height: 24,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: AppColors.accent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                     language == 'ar' ?
                     course.category?.name['ar'] ?? ""
                         : course.category?.name['en'] ?? "",
                          style: TextStyles.font10White500,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      course.professor == null ?
                      Text("no available info for profssor."):
                      WidgetTextRow(
                        myWidget: course.professor!.media.isNotEmpty ?
                           CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 14,
                          backgroundImage: CachedNetworkImageProvider(
                                  course.professor?.media[0].preview ?? ""
                              )
                               ,
                        ):const CircleAvatar(
                            radius: 14,
                            backgroundImage: AssetImage(ImagesManager.doctorPlaceHolder)


                        ),
                        txt: course.professor?.name ?? "",
                        textColor: AppColors.textMedium,
                        iconFirst: true,
                        textSize: 10,
                      ),
                      SizedBox(height: 4,),
                      Container(
                        width: 200,
                        child: Text(
                          language == "ar"
                              ? course.courseName['ar'] ?? ""
                              : course.courseName['en'] ?? "",
                          style: TextStyles.font14TxtPrimary600,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            appLocalizations.coursePrice,
                            style: TextStyles.font14TxtLightGrey500,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            course.coursePrice ?? "0.0",
                            style: TextStyles.font14TxtLightGreen600,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            appLocalizations.currencyCode,
                            style: TextStyles.font14TxtLightGrey500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                         IconTextChip(
                           text:  "${course.stats?["videos"].toString() ?? "0"}  ${appLocalizations.video}",
                           icon: Icons.video_collection_outlined,
                         ),
                          SizedBox(width: 8),
                         IconTextChip(
                             text: "${course.stats?["files"].toString() ?? "0"} ${appLocalizations.files}",
                             icon: Icons.file_copy_outlined)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Icon(
              Icons.bookmark_outline_outlined,
              color: AppColors.accent,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
