import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/shimmerLoading.dart';



class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerLoader(height: 20,width: 130,),
            ShimmerLoader(height: 20,width: 80,),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            ShimmerLoader(height: 50,width: 50,rounded: true,),
            SizedBox(width: 5,),
            ShimmerLoader(height: 50,width: 50,rounded: true,),
            SizedBox(width: 5,),
            ShimmerLoader(height: 50,width: 50,rounded: true,),
            SizedBox(width: 5,),
            ShimmerLoader(height: 50,width: 50,rounded: true,),
            SizedBox(width: 5,),
            ShimmerLoader(height: 50,width: 50,rounded: true,),
          ],
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
