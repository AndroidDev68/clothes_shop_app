
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/lib.dart';
import 'package:flutter_application/pages/authentication/signup/signup_page.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class SelectOptionPage extends StatefulWidget {
  static const ROUTE_NAME = 'SelectOptionPage';

  const SelectOptionPage();

  @override
  _SelectOptionPageState createState() => _SelectOptionPageState();
}

class _SelectOptionPageState extends State<SelectOptionPage> {
  static const TAG = 'SelectOptionPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(Assets.images.selectOptionPage.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  kSpacingItem8,
                  Text("Geeta.", style: AppTypography.header6,textAlign: TextAlign.center,),
                  kSpacingItem8,
                  Text("Create your fashion \nin your own way",
                    style: AppTypography.header4,textAlign: TextAlign.center,),
                  kSpacingItem4,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Text("Each men and women has their own style, Geeta help you to create your unique style.",
                      style: AppTypography.bodyText1, textAlign: TextAlign.center,),
                  ),
                  kSpacingItem7,
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, SignupPage.ROUTE_NAME);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: kPadding[4],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          )
                        ),
                        primary: Colors.transparent,
                        onPrimary: Colors.black,
                        textStyle: AppTypography.smallButton
                      ),
                      child: Text("LOGIN")),
                  kSpacingItem3,
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text:"___", style: AppTypography.bodyText1.copyWith(color: Colors.grey),),
                      TextSpan(text:" OR ", style: AppTypography.bodyText1.copyWith(color: Colors.black),),
                      TextSpan(text:"___", style: AppTypography.bodyText1.copyWith(color: Colors.grey),),
                    ]
                  )),
                  kSpacingItem3,
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, SignInPage.ROUTE_NAME);
                  }, child: Text("REGISTER"))

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}