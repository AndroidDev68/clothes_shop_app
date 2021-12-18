import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RateWidget extends StatelessWidget {
  double rateStar;

  RateWidget(this.rateStar);

  @override
  Widget build(BuildContext context) {
    int starCaculate = rateStar.truncate();
    return SizedBox(
      width: 100,
      height: 20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index){
            if(index < starCaculate){
              return SvgPicture.asset(Assets.icons.icStarYellow, width: 16, height: 16,);
            }else{
              return SvgPicture.asset(Assets.icons.icStarGray, width: 16, height: 16,);
            }
        },
      ),
    );
  }
}