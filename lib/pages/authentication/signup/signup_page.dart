import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_application/widgets/form/app_text_form_field_custom_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPage extends StatefulWidget {
  static const ROUTE_NAME = 'SignupPage';

  const SignupPage();

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  static const TAG = 'SignupPage';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Image.asset(
                Assets.images.signup.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: kPadding[5],
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSpacingItem7,
                    SvgPicture.asset(
                      Assets.icons.icBackArrow,
                      width: 18,
                      height: 18,
                    ),
                    kSpacingItem7,
                    Text("Welcome Back!", style: AppTypography.header4.copyWith(color: Colors.white),),
                    kSpacingItem4,
                    Padding(
                      padding: const EdgeInsets.only(right: 36.0),
                      child: Text("Yay! You're back! Thanks for shopping with us.\n"
                          "We have excited deals and promotions going on, grab your pick now!",
                      style: AppTypography.bodyText1.copyWith(color: Colors.white),),
                    ),
                    kSpacingItem8,
                    Text("LOGIN", style: AppTypography.header3.copyWith(color: Colors.white),)
                  ],
                ),
              ),
            ],
          )),
          Expanded(child: Container(
            alignment: Alignment.topLeft,
            padding: kPadding[6],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormFieldCustomIcon(
                  title: "Email address",
                  leadingIcon: SvgPicture.asset(Assets.icons.icEmail),
                  trailingIcon: SvgPicture.asset(Assets.icons.icWarningCirclePuple),
                  textEditingController: emailController,
                )
              ],
            ),


          )),
        ],
      ),
    ));
  }
}
