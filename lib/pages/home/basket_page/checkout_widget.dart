import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/data/blocs/basket_bloc/basket_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, Map<String, ProductDto>>(
      builder: (context, state) {
        if(state.isNotEmpty){
          double totalPrice = 0;

          state.forEach((key, value) {
            totalPrice += value.countOnBasket
                * double.parse(value.price.replaceRange(0, 1, ""));
          });
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            height: 80,
            child: ElevatedButton(

              onPressed: (){

              },
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset(Assets.icons.icCheckout, width: 18, height: 18,),
                  const SizedBox(width: 8,),
                  Text("GO TO CHECKOUT", style: AppTypography.bodyText1.copyWith(fontWeight: FontWeight.w900),),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                        color: const Color(0xff472CB6),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text("\$${totalPrice.toStringAsFixed(2)}", style: AppTypography.bodyText1.copyWith(color: Colors.white),),
                  )

                ],
              ),
            ),
          );
        }
        return Container();

      },
    );
  }
}