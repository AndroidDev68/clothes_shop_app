import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';

class TextPriceWidget extends StatelessWidget {
  String price = "\$1234.987";
  Color color;

  TextPriceWidget({required this.price, required this.color});

  @override
  Widget build(BuildContext context) {
    List<String> priceArray = price.split(".");
    return RichText(text: TextSpan(
      children:[
        TextSpan(text: priceArray.first+".",
            style: AppTypography.header3.copyWith(fontSize: 20, color: color),),
        TextSpan(text: priceArray.last,
            style: AppTypography.bodyText1.copyWith(color: color),),
      ]
    ));
  }
}