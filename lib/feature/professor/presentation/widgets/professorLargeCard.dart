import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/icon_text_chip.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/imagesManager.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/widgets/widgetTextRow.dart';
import '../../data/models/professor/professor.dart';
import '../pages/professor_details_view.dart';

class ProfessorLargeCard extends StatelessWidget {
  Color? backgroundColor;
  Professor professor;
  late  AppLocalizations appLocalizations;
   ProfessorLargeCard({
     Key? key,
     this.backgroundColor,
     required this.professor
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    appLocalizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        context.popUpPage(ProfessorDetailsView(
          professor: professor,
        ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,


        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: LayoutHandler(context).mainHorizontalPadding()),
              child: Row(
                children: [
                  WidgetTextRow(
                    spaceBetween: 12,
                    myWidget: professor.media.isNotEmpty ?
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 40,
                      backgroundImage:
                      CachedNetworkImageProvider(
                          professor.media[0].preview ?? "")


                    ):
                    Image.asset(ImagesManager.doctorPlaceHolder
                    ,height: 70,
                      width: 70,
                    ),
                    txt: professor.name ?? "",
                    textColor: AppColors.textMedium,
                    iconFirst: true,
                    textSize: 18,
                  ),
                  Spacer(),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 18,

                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: LayoutHandler(context).mainHorizontalPadding(),
                vertical: 8
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconTextChip(
                      text: "${professor.stats?["students"] ?? "0"} ${appLocalizations.student}",
                      icon: Icons.supervisor_account_outlined),
                  IconTextChip(
                      text: "${professor.stats?["courses"] ?? "0"} ${appLocalizations.courses}",
                      icon: Icons.bookmark_border_outlined),
                  IconTextChip(
                      text: "${professor.stats?["videos"] ?? "0"} ${appLocalizations.video}",
                      icon: Icons.play_circle_outline_outlined),
                  IconTextChip(
                      text: "${professor.stats?["files"] ?? "0"} ${appLocalizations.files}",
                      icon: Icons.file_copy_outlined),





                ],
              ),
            ),

            Divider(
              height: 3,
              thickness: 1,
              color: AppColors.accent,
            )
          ],
        ),
      ),
    );
  }
}
