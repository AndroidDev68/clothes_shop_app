
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBadgeWidget extends StatefulWidget {
  static const ROUTE_NAME = 'IconBageWidget';
  int? countBadge;
  Widget icon;
  VoidCallback? onTap;

  IconBadgeWidget(this.icon, {Key? key, this.onTap,this.countBadge}) : super(key: key);

  @override
  _IconBadgeWidgetState createState() => _IconBadgeWidgetState();
}

class _IconBadgeWidgetState extends State<IconBadgeWidget> {
  static const TAG = 'IconBageWidget';
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: widget.onTap,
      child: SizedBox(
        width: 28,
        height: 24,
        child: Stack(
          children: [
            Positioned.fill(
                left: 4,
                child: widget.icon),
            if(widget.countBadge != null)
              Container(
                alignment: Alignment.center,
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: colorAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(widget.countBadge.toString(),
                    style: AppTypography.subtitle.copyWith(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}