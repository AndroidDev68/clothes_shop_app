import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/app_widget/profile_item_widget.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DraweEnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Image.asset(Assets.images.drawerLeft.path, width: double.infinity, height: double.infinity, fit: BoxFit.fill,),
          Container(
            padding: const EdgeInsets.only(top: 48, bottom: 32, left: 16, right: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkResponse(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(Assets.icons.icCloseWhite, width: 24, height: 24,)),
                  ],
                ),
                kSpacingItem6,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32.0),
                      child: Image.asset(Assets.images.icAvatar.path, width: 64, height: 64, fit: BoxFit.cover,),),
                    const SizedBox(width: 12,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nguyễn Văn Thành", style: AppTypography.header3.copyWith(color: Colors.white),),
                        const SizedBox(height: 4,),
                        Text("thahnguyen9908@mail.com",style: AppTypography.bodyText1.copyWith(color: Colors.white,
                            fontWeight: FontWeight.normal),),
                        kSpacingItem2,
                      ],
                    ),
                    const SizedBox(width: 12,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Assets.icons.icEditWhite, width: 24, height: 24,),
                      ],
                    ),

                  ],
                ),
                kSpacingItem5,
                ProfileItemWidget(Assets.icons.icBasket,"Orders"),
                kSpacingItem5,
                ProfileItemWidget(Assets.icons.icHeart,"Whitelist"),
                kSpacingItem5,
                ProfileItemWidget(Assets.icons.icPlaceWhite,"Delivery Address"),
                kSpacingItem5,
                ProfileItemWidget(Assets.icons.icPayment,"Payment Methods"),
                kSpacingItem5,
                ProfileItemWidget(Assets.icons.icPromo,"Promo Cord"),
                kSpacingItem5,
                ProfileItemWidget(Assets.icons.icNotificationWhite,"Notifications"),
                kSpacingItem5,
                ProfileItemWidget(Assets.icons.icHelpWhite,"Help "),
                kSpacingItem5,
                ProfileItemWidget(Assets.icons.icAbout,"About"),
                kSpacingItem7,
                ProfileItemWidget(Assets.icons.icCheckout,"LOG OUT"),

              ],
            ),
          )
        ]
      ),
    );
  }
}
