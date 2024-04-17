import 'package:flutter/material.dart';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/textStyles.dart';

class MyCourseTabBar extends StatefulWidget {
  final TabController tabController;
  final List<String> items;
  const MyCourseTabBar(
      {super.key, required this.tabController, required this.items});

  @override
  State<MyCourseTabBar> createState() => _MyCourseTabBarState();
}

class _MyCourseTabBarState extends State<MyCourseTabBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      height: 50,
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          ...widget.items.map(
                (e) => Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: widget.tabController.index == widget.items.indexOf(e)
                          ? AppColors.accent
                          : Colors.transparent,
                      width: 3, // Underline thickness
                    ),
                  ),
                ),

                child: MaterialButton(
                  minWidth: double.infinity,

                  height: 30,

                  onPressed: () {
                    setState(() {
                      widget.tabController.index = widget.items.indexOf(e);
                    });
                  },
                  child: Text(
                e,
                    style: TextStyle(


                      fontSize: 16.0,
                       color: widget.tabController.index == widget.items.indexOf(e)
                           ? AppColors.accent
                           : AppColors.accent.withAlpha(110),
                      fontWeight: FontWeight.w600,
                    )

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
