
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/data/blocs/basket_bloc/basket_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/app_widget/text_price_widget.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketItemWidget extends StatefulWidget {
  static const ROUTE_NAME = 'BasketItemWidget';
  int productId;

  BasketItemWidget(this.productId, {Key? key}) : super(key: key);

  @override
  _BasketItemWidgetState createState() => _BasketItemWidgetState();
}

class _BasketItemWidgetState extends State<BasketItemWidget> {
  static const TAG = 'BasketItemWidget';
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BasketBloc, Map<String, ProductDto>>(
      builder: (context, state) {
        if(state.containsKey(widget.productId.toString())){
          ProductDto productDto = state[widget.productId.toString()]!;
          return Container(
            height: 146,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                color: const Color(0xffF1F4FB),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
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
                        const Spacer(),
                        TextPriceWidget(price: productDto.price, color: Colors.black,),
                        kSpacingItem2
                      ],
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: (){
                            context.read<BasketBloc>().removeProduct(productDto.id);
                          },
                          child: SvgPicture.asset(Assets.icons.icClose,width: 24, height: 24,)),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xffD3D3D3), width: 1)
                        ),
                        child:Row(
                          children: [
                            InkResponse(
                                onTap: (){
                                  if(productDto.countOnBasket > 0){
                                    productDto.countOnBasket--;
                                    context.read<BasketBloc>().add(productDto);
                                  }
                                },
                                child: SvgPicture.asset(Assets.icons.icMinus, width: 14, height: 14,)),
                            const SizedBox(width: 16,),
                            Text(productDto.countOnBasket.toString(), style: AppTypography.header3.copyWith(fontWeight: FontWeight.w900),),
                            const SizedBox(width: 16,),
                            InkResponse(
                                onTap: (){
                                  productDto.countOnBasket++;
                                  context.read<BasketBloc>().add(productDto);
                                },
                                child: SvgPicture.asset(Assets.icons.icPlus, width: 14, height: 14,)),
                          ],
                        ),
                      ),
                    ],
                  )
                ]
            ),
          );
        }
        return Container();
      },
    );
  }
}