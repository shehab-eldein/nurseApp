import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/actionButton.dart';
import 'package:nurse_space/core/widgets/widgetTextRow.dart';
import 'package:nurse_space/feature/courses/presentation/pages/myCoursesDetailsView.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/widgets/icon_text_chip.dart';
import '../../data/models/course/course.dart';
import '../pages/buyCourseDetailsView.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CourseLargeCard extends StatelessWidget {
  final Course course;

  const CourseLargeCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final language = context.read<LanguageBloc>().state.languageCode;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),

                child: course.media.isNotEmpty? CachedNetworkImage(
                  imageUrl: course.media[0].preview ?? "",
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ): Image.asset(ImagesManager.placeholder,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,


                )
                ,
              ),
              Positioned(
                top: 5,
                right: 5,

                child: IconTextChip(
                  text: language == "ar"
                      ? course.category!.name["ar"]!
                      :course.category!.name["en"]!
                  ,
                  backgroundColor: AppColors.accent,
                  noIcon: true,
                  textColor: Colors.white70,

                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Container(
                width: LayoutHandler(context).valuesHandler(
                    240,
                    200,
                    300,
                    250),

                child: Text(
                  course.courseName?['ar'] ??
                      course.courseName?['en'] ??"No Name",
                  style: TextStyles.font18TxtBlack500,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const Spacer(),
              IconTextChip(
                text: "${course.stats?["videos"] ?? "0"} ${appLocalizations.video}",
                icon: Icons.play_circle_outline_outlined,
                backgroundColor: AppColors.lightBlue ,

              ),


            ],
          ),
          const SizedBox(height: 8,),
          Row(
            children: [
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
              const Spacer(),

              IconTextChip(
                text: "${course.stats?["files"] ?? "0"} ${appLocalizations.files}",
                icon: Icons.file_copy_outlined,
                backgroundColor: AppColors.lightBlue ,

              ),

            ],
          ),
          const SizedBox(height: 8,),
          Row(
            children: [
              Text(appLocalizations.courseProgressRate,
                style: TextStyles.font13TxtDark600,

              ),
              const Spacer(),
              Text("0%",
                style: TextStyles.font13TxtDark600,

              ),


            ],
          ),
          const SizedBox(height: 8,),
          LinearPercentIndicator(
            percent: 0.0,
            barRadius: const Radius.circular(10),
            isRTL: language == "ar" ?true: false ,
            lineHeight: 8,
            progressColor: AppColors.accent,
            backgroundColor: AppColors.accent.withAlpha(50),
            trailing: Icon(
              CupertinoIcons.checkmark_seal_fill,
              size: 14,
              color: AppColors.accent.withAlpha(100),),

          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              Text(appLocalizations.dateOfJoiningCourse,
                style: TextStyles.font13TxtDark600,

              ),
              const Spacer(),
             SizedBox(

               height: 38,
               child: ActionButton(

                   text: appLocalizations.continuee ,
                   icon: language == "ar"
                       ?Icons.keyboard_double_arrow_left_sharp
                       : Icons.keyboard_double_arrow_right_sharp,
                   iconColor: AppColors.textLight,
                   textColor: AppColors.textLight,
                   buttonColor: Colors.white,
                   borderColor: AppColors.textLight,

                   onTap: () => context.popUpPage(
                       MyCourseDetailsView(
                         course: course,))
                   ),
             )


            ],
          ),



        ],
      ),

    );
  }
}
