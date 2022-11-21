import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckboxRememberMeWidget extends StatefulWidget {
  static const ROUTE_NAME = 'CheckboxRememberMeWidget';

  const CheckboxRememberMeWidget({Key? key}) : super(key: key);

  @override
  _CheckboxRememberMeWidgetState createState() =>
      _CheckboxRememberMeWidgetState();
}

class _CheckboxRememberMeWidgetState extends State<CheckboxRememberMeWidget> {
  static const TAG = 'CheckboxRememberMeWidget';
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!checked)
          InkResponse(
            radius: 24,
            child: SvgPicture.asset(
              Assets.icons.icCheckbox,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
            onTap: () {
              checked = !checked;
              setState(() {});
            },
          ),
        if (checked)
          InkResponse(
            radius: 24,
            child: SvgPicture.asset(Assets.icons.icCheckedbox,
                width: 24, height: 24, fit: BoxFit.cover),
            onTap: () {
              checked = !checked;
              setState(() {});
            },
          ),
        const SizedBox(
          width: 12,
        ),
        Text(
          "Remember me",
          style: AppTypography.bodyText2,
        )
      ],
    );
  }
}
