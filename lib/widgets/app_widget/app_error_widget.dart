import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';

class AppErrorWidget extends StatelessWidget {
  String errorMessage;

  AppErrorWidget(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(errorMessage,style: AppTypography.header3,),
    );
  }
}