import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/data/blocs/favorite/favorite_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/app_widget/text_price_widget.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class FavoriteItemWidget extends StatelessWidget {
  int productId;

  FavoriteItemWidget(this.productId);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, Map<String, ProductDto>>(
      builder: (context, state) {
        if(state.containsKey(productId.toString())){
          ProductDto productDto = state[productId.toString()]!;
          return Container(
            height: 124,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color(0xffF1F4FB),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(productDto.image, width: 80,),
                const SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productDto.name, style: AppTypography.bodyText1.copyWith(color: colorAccent),),
                      const SizedBox(height: 4,),
                      Text(productDto.productCategory, style: AppTypography.bodyText2.copyWith(color: const Color(0xffA1A1A1)),),
                      kSpacingItem2,
                      Text(productDto.descriptions, maxLines: 3, style: AppTypography.bodyText2.copyWith(color: const Color(0xffA1A1A1)),),
                    ],
                  ),
                ),
                const SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextPriceWidget(price: productDto.price, color: Colors.black,),
                    const Spacer(),
                    SvgPicture.asset(Assets.icons.icNext, width: 24, height: 24,),
                  ],
                )
              ],
            ),

          );
        }
        return Container();

      },
    );
  }
}