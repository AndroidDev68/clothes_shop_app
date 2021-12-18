import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/data/blocs/auth/auth_bloc.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/authentication/signup/checkbox_remember_me_widget.dart';
import 'package:flutter_application/pages/authentication/signup/signup_page.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_application/widgets/form/app_text_form_field_material_custom_icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';

class SignInPage extends StatefulWidget {
  static const ROUTE_NAME = 'SignInPage';
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: scrollController,
        child: SizedBox(
          width:width,
          height: height,
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
                            InkResponse(
                              child: SvgPicture.asset(
                                Assets.icons.icBackArrow,
                                width: 18,
                                height: 18,
                              ),
                              onTap: (){
                                Navigator.of(context).pop();
                              },
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
                    AppTextFormFieldMaterialCustomIcon(
                      focusNode: FocusNode(),
                      colorShadowStream: StreamController<Color>.broadcast(),
                      controller: emailController,
                      labelText: "Email address",
                      hintText: "Enter your email address",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      leadingIcon: SvgPicture.asset(Assets.icons.icEmail, width: 24, height: 24,),
                      trailingIcon: SvgPicture.asset(Assets.icons.icWarningCirclePuple, width: 24, height: 24,),
                    ),
                    kSpacingItem5,
                    AppTextFormFieldMaterialCustomIcon(
                      focusNode: FocusNode(),
                      colorShadowStream: StreamController<Color>.broadcast(),
                      controller: passwordController,
                      labelText: "Password",
                      hintText: "Enter your email address",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isPassword: true,
                      leadingIcon: SvgPicture.asset(Assets.icons.icLock, width: 24, height: 24,),
                    ),
                    kSpacingItem4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxRememberMeWidget(),
                        Text("Forgot Password?",
                          style: AppTypography.bodyText2.copyWith(color: colorAccent,fontWeight: FontWeight.w700 ),)
                      ],
                    ),
                    kSpacingItem3,
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(onPressed: (){
                        context.read<AuthBloc>().login(emailController.text.trim(),
                            passwordController.text.trim());
                      },
                          child: Text("LOGIN")),
                    ),
                    kSpacingItem2,
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, SignupPage.ROUTE_NAME);
                        },
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                children:[
                                  TextSpan(text: "Not registered yet?", style: AppTypography.bodyText2.copyWith(color: const Color(0xffA1A1A1))),
                                  TextSpan(text: " Create an Account", style: AppTypography.bodyText2.copyWith(color: colorAccent)),
                                ]
                            )),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
