import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import 'package:nurse_space/core/widgets/titleBackAppBar.dart';
import 'package:nurse_space/core/widgets/video_container.dart';
import 'package:nurse_space/feature/courses/data/models/lesson/lesson.dart';
import 'package:nurse_space/feature/courses/presentation/widgets/examWidget.dart';
import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/language/presentation/manager/languageBloc.dart';
import '../../../../core/widgets/widgetTextRow.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../widgets/pdf_viewr.dart';

class LessonView extends StatelessWidget {

  final Lesson lesson;
  final int index;
  const LessonView({
    super.key,
    required this.lesson,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    final language = context.read<LanguageBloc>().state.languageCode;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final LayoutHandler layoutHandler =LayoutHandler(context);


    return Scaffold(
      appBar: TitleBackAppBar(
        title: appLocalizations.lesson,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,

              padding: EdgeInsets.symmetric(horizontal: layoutHandler.mainHorizontalPadding()),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.accent.withAlpha(50), // Background color of the container

              ),
              child: WidgetTextRow(

                myWidget: Container(

                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.accent,width: 2),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: TextStyles.font16Accent600,

                    ),
                  ),
                ),
                txt:  language == "ar"
                    ?lesson.name!["ar"] ?? "لا يوجد عنوان متاح"
                    : lesson.name!["en"] ?? "No title available"
                ,
                textColor: AppColors.primary,
                iconFirst: true,
                mainAxisAlignment: MainAxisAlignment.start,
                textStyle: TextStyles.font16TxtPrimary600,
                spaceBetween: 25,






              ),

            ),
            const Divider(height: 1,color: AppColors.accent,),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: layoutHandler.mainHorizontalPadding(),


              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16,),
                  Text(
                      language == "ar"
                          ? lesson.name!["ar"] ?? ""
                          :lesson.name?["en"] ?? ""
                          ,style: TextStyles.font14TxtPrimary600,

                  ),
                  const SizedBox(height: 16,),
                  //todo get video from url
                  VideoContainer(videoUrl: "fasfasfa"),
                  const SizedBox(height: 16,),
                  Center(
                    child: ElevatedButton(

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            //todo get pdf from url
                            PdfViewerPage(pdfUrl: 'your_pdf_url_here'),
                          ),
                        );
                      }, child: Text(
                      "PDF",
                      style: TextStyles.font18Primary600,
                    ),
                    ),
                  ),

                  const SizedBox(height: 16,),

                  HtmlWidget(
                      "${lesson.course_description?["ar"] != null
                          ? lesson.course_description!["ar"]
                          : "" }"


                  ),





                  
                ],
              ),
            ),
            const Divider(height: 1,color: AppColors.accent,),

            ExamWidget(
                question: "test test",
                choices: ["test1","test2","test3"],
                correctIndex: 0
            ),
            ExamWidget(
                question: "test test",
                choices: ["test1","test2","test3"],
                correctIndex: 2
            )
          ],
        ),

      ),
    );
  }
}
