
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/data/blocs/home/home_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'product_detail_widget.dart';

class ProductDetailPage extends StatefulWidget {

  static const ROUTE_NAME = 'ProductDetailPage';
  final int productId;

  const ProductDetailPage(this.productId,{Key? key}) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  static const TAG = 'ProductDetailPage';
  late ProductDto productDto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, Map<String, ProductDto>>(
        builder: (context, state) {
          if(state.containsKey(widget.productId.toString())){
            productDto = state[widget.productId.toString()]!;
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children:[
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(bottom: 24),
                            color: const Color(0xffF1F4FB),
                            child: Image.asset(productDto.image, width: 280,),
                          ),
                          Positioned.fill(
                            top: 48,
                            left: 24,
                            right: 24,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  InkResponse(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: SvgPicture.asset(Assets.icons.icBackArrowBlack, width: 18, height: 18,),),
                                  const Spacer(),
                                  Container(
                                      width: 46,
                                      height: 46,
                                      padding: const EdgeInsets.only(top: 2),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(Assets.icons.icHeart, width: 24, height: 24,)
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(

                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                        ),
                        child: ProductDetailWidget(productDto),
                      ),
                    )
                  ],
                )
              ],
            );
          }
          return Container();

        },
      ));
  }
}