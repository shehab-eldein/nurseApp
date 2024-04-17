import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/constant/appColors.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final BuildContext widgetContext;
  final bool? showBackButton;
  final bool? showSearch;
  final bool? showNotification;
  final bool? showLogo;
  final bool? hideElevation;
  final bool? hideActions;

  TopBar(
      {required this.appBar,
        required this.widgetContext,
        required this.showBackButton,
        this.hideElevation,
        this.showLogo,
        this.showSearch,
        this.showNotification,
        this.hideActions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: hideElevation != null && hideElevation == true ? 0 : 2,
      shadowColor: Colors.grey.shade100,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: false,
      leading: showBackButton != null && showBackButton!
          ? Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: showBackButton!,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Material(
              color: Colors.transparent,
              child: BackButton(
                  color: AppColors.primary,
                  onPressed: () {

                  }),
            ),
          ),
        ),
      )
          : null,
      title: Visibility(
        visible: showLogo ?? true,
        child: SizedBox(
            width: 104, height: 25, child: Image.asset("images/logo.png")),
      ),
      actions: hideActions != null && hideActions == true
          ? null
          : [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: Colors.grey[500],
              onTap: () {

              },
              child: const Icon(
                Icons.bookmark,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: Colors.grey[500],
              onTap: () {

              },
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.email_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 10,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF14336),
                        shape: OvalBorder(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: Colors.grey[500],
              onTap: () {

              },
              child: const Icon(
                Icons.person_outline,
                color: AppColors.accent,
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
