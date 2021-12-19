import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItemWidget extends StatelessWidget {
  String iconPath;
  String title;


  ProfileItemWidget(this.iconPath, this.title);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset(iconPath, color: Colors.white,width: 24, height: 24,),
        const SizedBox(width: 16,),
        Text(title, style: AppTypography.bodyText1.copyWith(color: Colors.white, fontWeight: FontWeight.w900),),
      ],
    );
  }
}