import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/imagesManager.dart';
import '../../../../core/constant/textStyles.dart';

class ProfileInfoCard extends StatelessWidget {
  final String? name;
  final String? email;
  final String? phone;

  const ProfileInfoCard(
      {super.key,
       this.name,
       this.email,
       this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      padding: EdgeInsets.symmetric(
          horizontal: LayoutHandler(context).mainHorizontalPadding()),
      color: AppColors.accent.withAlpha(80),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 94,
            width: 94,
            decoration: BoxDecoration(
                color: AppColors.accent,
                border: Border.all(color: AppColors.accent, width: 2),
                borderRadius: BorderRadius.circular(50)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                ImagesManager.doctorPlaceHolder,
                height: 94,
                width: 94,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? "No name",
                style: TextStyles.font18Primary600,
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: 220,
                child: Text(
                  email ?? "No email",
                  style: TextStyles.font18TxtLightGrey500,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                phone ?? "No phone number",
                style: TextStyles.font18TxtLightGrey500,
              )
            ],
          )
        ],
      ),
    );
  }
}
