import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';

class TabBarItemCustom extends StatelessWidget {
  String title;
  Color? indicatorColor;
  Color? titleColor;

  TabBarItemCustom(this.title, {Key? key, this.titleColor, this.indicatorColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.header2.copyWith(color: titleColor ?? colorAccent,fontWeight: FontWeight.w900,)),
          const SizedBox(height: 6,),
          Container(
            width: 20,
            height: 4,
            decoration: BoxDecoration(
              color: indicatorColor ?? Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(2)
            ),
          )
        ],
      ),
    );
  }
}