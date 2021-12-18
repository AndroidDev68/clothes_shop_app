import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/data/blocs/home/home_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/home/product_detail/product_detail_page.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
  int productId;

  ProductWidget(this.productId);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, Map<String, ProductDto>>(builder: (context, state){

      if(state.containsKey(productId.toString())){
        ProductDto productDto = state[productId.toString()]!;
        return InkResponse(
          onTap: (){
            Navigator.pushNamed(context, ProductDetailPage.ROUTE_NAME, arguments: productId);
          },
          child: SizedBox(
            height: 276,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Stack(
                      children:[
                         Container(
                           padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                           alignment: Alignment.bottomCenter,
                           decoration: BoxDecoration(
                             color: const Color(0xffF1F4FB),
                             borderRadius: BorderRadius.circular(30),
                           ),
                           child: Image.asset(productDto.image),
                         ),
                        Positioned.fill(
                            top: 16,
                            right: 16,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgPicture.asset(Assets.icons.icHeart, width: 24, height: 24,),
                          ),
                        )
                      ],
                )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        kSpacingItem,
                        Text(productDto.name, style: AppTypography.title,),
                        kSpacingItem2,
                        Text(productDto.price,
                          style: AppTypography.header3.copyWith(color: const Color(0xffA1A1A1)),)
                      ],
                    ),
                )
              ],
            ),
          ),
        );
      }else{
        return Container();
      }
    });
  }
}