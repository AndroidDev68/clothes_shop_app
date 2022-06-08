import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/data/blocs/auth/auth.dart';
import 'package:flutter_application/domain/model/error_model.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/lib.dart';
import 'package:flutter_application/pages/authentication/select_option_page.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_application/widgets/form/app_text_form_field_material_custom_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/dialog/dialog_utils.dart';
import 'checkbox_remember_me_widget.dart';

class SignupPage extends StatefulWidget {
  static const ROUTE_NAME = 'SignupPage';

  const SignupPage();

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  static const TAG = 'SignupPage';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              Expanded(
                flex: 2,
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
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          kSpacingItem7,
                          Text(
                            "Get’s started with Geeta.",
                            style: AppTypography.header4
                                .copyWith(color: Colors.white),
                          ),
                          kSpacingItem2,
                          Padding(
                            padding: const EdgeInsets.only(right: 36.0),
                            child: Text(
                              "Already have an account? Log in",
                              style: AppTypography.bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          kSpacingItem7,
                          Text(
                            "REGISTER",
                            style: AppTypography.header3
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: kPadding[6],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFormFieldMaterialCustomIcon(
                        focusNode: FocusNode(),
                        colorShadowStream: StreamController<Color>.broadcast(),
                        controller: nameController,
                        labelText: "Your name",
                        hintText: "Your full name",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        leadingIcon: SvgPicture.asset(
                          Assets.icons.icUser,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      kSpacingItem5,
                      AppTextFormFieldMaterialCustomIcon(
                        focusNode: FocusNode(),
                        colorShadowStream: StreamController<Color>.broadcast(),
                        controller: emailController,
                        labelText: "Email address",
                        hintText: "Enter your email address",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        leadingIcon: SvgPicture.asset(
                          Assets.icons.icLock,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      kSpacingItem5,
                      AppTextFormFieldMaterialCustomIcon(
                        focusNode: FocusNode(),
                        colorShadowStream: StreamController<Color>.broadcast(),
                        controller: passwordController,
                        labelText: "Password",
                        hintText: "Enter your password",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        isPassword: true,
                        leadingIcon: SvgPicture.asset(
                          Assets.icons.icLock,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      kSpacingItem3,
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                            onPressed: () => _clickSignUp,
                            child: const Text("REGISTER")),
                      ),
                      kSpacingItem,
                      Center(
                        child: Text(
                          "By  joining I agree to receive emails from Geeta.",
                          style: AppTypography.bodyText2
                              .copyWith(color: const Color(0xffA1A1A1)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _clickSignUp() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    context
        .read<AuthBloc>()
        .register(emailController.text, passwordController.text)
        .then(
      (value) {
        DialogUtils.showDialogConfirm(
          context: context,
          message: value,
          onOk: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                SignInPage.ROUTE_NAME, (route) => true);
          },
        );
      },
    ).catchError(
      (exception) {
        DialogUtils.showDialogConfirm(
          context: context,
          message: (exception as ErrorModel).message,
        );
      },
    );
  }
}
