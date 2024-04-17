import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';
import 'package:nurse_space/core/constant/imagesManager.dart';
import 'package:nurse_space/core/extensions/contextExtenstion.dart';
import 'package:nurse_space/feature/auth/presentation/pages/expertView.dart';

import '../../../../core/constant/textStyles.dart';
import '../../data/models/professor/professor.dart';
import '../pages/professor_details_view.dart';


class ProfessorHomeCard extends StatelessWidget {


  final Professor professor;
  ProfessorHomeCard({
    Key? key,

    required this.professor




  }) : super(key: key);

  @override
  Widget build(BuildContext context) {





    return GestureDetector(
      onTap: (){

        context.popUpPage(ProfessorDetailsView(
          professor: professor,
        ));

      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            professor.media.isNotEmpty ?
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              backgroundImage:CachedNetworkImageProvider(professor.media[0].preview ?? ""),



            ) :
            Image.asset(ImagesManager.doctorPlaceHolder,height: 58, width: 58,),
            SizedBox(height: 6),
            Text(professor.name ?? "",
              style: TextStyles.font13TxtDark600,
            ),
            Text(professor.about?.replaceAll(RegExp(r'<[^>]*>'), '') ?? "",
              style: TextStyles.font10Grey600,

            ),
          ],
        ),
      ),
    )
    ;
  }
}
