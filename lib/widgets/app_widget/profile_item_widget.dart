import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;

  const ProfileItemWidget(this.iconPath, this.title, {Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24).copyWith(right: 12),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                color: Colors.white,
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: AppTypography.bodyText1
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
