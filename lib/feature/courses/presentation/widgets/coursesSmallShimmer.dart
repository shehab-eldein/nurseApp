import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurse_space/core/handlers/layoutHandler.dart';
import '../../../../core/widgets/shimmerLoading.dart';

class CoursesSmallShimmer extends StatelessWidget {
   CoursesSmallShimmer({Key? key}) : super(key: key);
  late LayoutHandler layoutHandler;

  @override
  Widget build(BuildContext context) {
    layoutHandler = LayoutHandler(context);
    return SingleChildScrollView(
      padding:  EdgeInsets.symmetric(horizontal: layoutHandler.mainHorizontalPadding(),vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerLoader(height: 20,width: 130,),
              ShimmerLoader(height: 20,width: 80,),
            ],
          ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              ShimmerLoader(height: 100,width: double.infinity,rounded: true,),
              SizedBox(height:15,),
              ShimmerLoader(height: 100,width: double.infinity,rounded: true,),

            ],
          ),



        ],
      ),
    );
  }
}
