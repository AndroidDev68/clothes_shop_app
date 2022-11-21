import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/domain/model/error_model.dart';
import 'package:flutter_application/lib.dart';
import 'package:flutter_application/pages/authentication/select_option_page.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_application/widgets/form/app_text_form_field_material_custom_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/utils/string_extensions.dart';

import '../../../widgets/design_system/button_with_loading.dart';
import '../../../widgets/dialog/dialog_utils.dart';

class SignupPage extends StatefulWidget {
  static const ROUTE_NAME = 'SignupPage';

  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  static const TAG = 'SignupPage';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final scrollController = ScrollController();
  final StreamController<bool> registerLoadingController =
      StreamController.broadcast();
  final formKey = GlobalKey<FormState>();
  final nameColorController = StreamController<Color>.broadcast();
  final emailColorController = StreamController<Color>.broadcast();
  final passColorController = StreamController<Color>.broadcast();

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
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            AppTextFormFieldMaterialCustomIcon(
                              focusNode: FocusNode(),
                              colorShadowStream: nameColorController,
                              controller: nameController,
                              labelText: "Your name",
                              hintText: "Your full name",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              leadingIcon: SvgPicture.asset(
                                Assets.icons.icUser,
                                width: 24,
                                height: 24,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  nameColorController.sink
                                        .add(Colors.transparent);
                                  return "Your name is required!";
                                }
                                nameColorController.sink.add(Colors.redAccent);
                                return null;
                              },
                            ),
                            kSpacingItem5,
                            AppTextFormFieldMaterialCustomIcon(
                              focusNode: FocusNode(),
                              colorShadowStream: emailColorController,
                              controller: emailController,
                              labelText: "Email address",
                              hintText: "Enter your email address",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  emailColorController.sink.add(Colors.transparent);
                                  return "Email name is required!";
                                } else if (!value.isEmail) {
                                  emailColorController.sink.add(Colors.transparent);
                                  return "Email isn't correct!";
                                }
                                emailColorController.sink.add(Colors.redAccent);
                                return null;
                              },
                              leadingIcon: SvgPicture.asset(
                                Assets.icons.icLock,
                                width: 24,
                                height: 24,
                              ),
                            ),
                            kSpacingItem5,
                            AppTextFormFieldMaterialCustomIcon(
                              focusNode: FocusNode(),
                              colorShadowStream: passColorController,
                              controller: passwordController,
                              labelText: "Password",
                              hintText: "Enter your password",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  passColorController.sink.add(Colors.transparent);
                                  return "Password is required!";
                                } else if (value.length < 6) {
                                  passColorController.sink.add(Colors.transparent);
                                  return "Password must be more than 6 characters!";
                                }
                                passColorController.sink.add(Colors.redAccent);
                                return null;
                              },
                              leadingIcon: SvgPicture.asset(
                                Assets.icons.icLock,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      kSpacingItem3,
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ButtonWithLoading(
                          title: Text(
                            "REGISTER",
                            style: AppTypography.bodyText1
                                .copyWith(color: Colors.white),
                          ),
                          loadingController: registerLoadingController,
                          onPressed: _clickSignUp,
                          bgColor: colorAccent,
                          borderRadius: 56,
                        ),
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
    if (formKey.currentState?.validate() ?? false) {
      registerLoadingController.sink.add(true);
      FocusManager.instance.primaryFocus?.unfocus();
      context
          .read<AuthBloc>()
          .register(emailController.text, passwordController.text,
              nameController.text)
          .then(
        (value) {
          registerLoadingController.sink.add(false);
          DialogUtils.showDialogConfirm(
            context: context,
            message: value,
            onOk: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(SignInPage.ROUTE_NAME, (route) {
                if (route.settings.name != SelectOptionPage.ROUTE_NAME) {
                  return false;
                }
                return true;
              });
            },
          );
        },
      ).catchError(
        (exception) {
          registerLoadingController.sink.add(false);
          DialogUtils.showDialogConfirm(
            context: context,
            message: (exception as ErrorModel).message,
          );
        },
      );
    }
  }
}
