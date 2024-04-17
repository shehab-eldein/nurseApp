import 'package:flutter/cupertino.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/textStyles.dart';
import '../../../../core/widgets/iconTextRow.dart';



class ViewAllRow extends StatelessWidget {
  final String title;
  final VoidCallback onViewAllTap;

  const ViewAllRow({
    Key? key
    ,required this.title,
    required this.onViewAllTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: TextStyles.font18TxtBlack500,

        ),
        GestureDetector(
          onTap: onViewAllTap,
          child: IconTextRow(
            icon: CupertinoIcons.right_chevron,
            txt: appLocalizations.viewAll,
            iconColor: AppColors.textLight,
            textColor: AppColors.textLight,

          ),
        )
      ],
    );
  }
}
