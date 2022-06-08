import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/data/blocs/auth/auth.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/app_widget/profile_item_widget.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DraweEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(children: [
        Image.asset(
          Assets.images.drawerLeft.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 48, bottom: 32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                          Assets.icons.icCloseWhite,
                          width: 24,
                          height: 24,
                        )),
                  ],
                ),
              ),
              kSpacingItem6,
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32.0),
                      child: Image.asset(
                        Assets.images.icAvatar.path,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nguyễn Văn Thành",
                            maxLines: 2,
                            style: AppTypography.header3
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "thahnguyen9908@mail.com",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.bodyText1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          kSpacingItem2,
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.icEditWhite,
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              kSpacingItem4,
              ProfileItemWidget(Assets.icons.icBasket, "Orders"),
              ProfileItemWidget(Assets.icons.icHeart, "Whitelist"),
              ProfileItemWidget(Assets.icons.icPlaceWhite, "Delivery Address"),
              ProfileItemWidget(Assets.icons.icPayment, "Payment Methods"),
              ProfileItemWidget(Assets.icons.icPromo, "Promo Cord"),
              ProfileItemWidget(
                  Assets.icons.icNotificationWhite, "Notifications"),
              ProfileItemWidget(Assets.icons.icHelpWhite, "Help "),
              ProfileItemWidget(Assets.icons.icAbout, "About"),
              ProfileItemWidget(Assets.icons.icCheckout, "LOG OUT", onTap: () {
                context.read<AuthBloc>().logout();
              }),
            ],
          ),
        )
      ]),
    );
  }
}
