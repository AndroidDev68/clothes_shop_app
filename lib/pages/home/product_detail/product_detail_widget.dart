
import 'dart:developer' as developer;
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';

import 'rate_widget.dart';
import 'select_size_widget.dart';

class ProductDetailWidget extends StatefulWidget {
  ProductDto productDto;

  ProductDetailWidget(this.productDto);

  static const ROUTE_NAME = 'ProductDetailWidget';
  @override
  _ProductDetailWidgetState createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  static const TAG = 'ProductDetailWidget';
  int productBuyCount = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24).copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.productDto.productCategory, style: AppTypography.productCategory,),
                      Text(widget.productDto.name, style: AppTypography.header4,),
                      kSpacingItem2,
                      RateWidget(widget.productDto.stars),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(widget.productDto.price, style: AppTypography.header4.copyWith(fontSize: 20),)
                  ],
                ),

              ],
            ),
            kSpacingItem4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                            if(productBuyCount > 0){
                              productBuyCount--;
                              setState(() {});
                            }
                          },
                          child: SvgPicture.asset(Assets.icons.icMinus, width: 18, height: 18,)),
                      const SizedBox(width: 16,),
                      Text(productBuyCount.toString(), style: AppTypography.header3.copyWith(fontWeight: FontWeight.w900),),
                      const SizedBox(width: 16,),
                      InkResponse(
                          onTap: (){
                            productBuyCount++;
                            setState(() {});
                          },
                          child: SvgPicture.asset(Assets.icons.icPlus, width: 18, height: 18,)),
                    ],
                  ),
                ),
                InkResponse(
                    onTap: (){
                      Share.share('Share jacket to other!!!!!');
                    },
                    child: SvgPicture.asset(Assets.icons.icShare, width: 46, height: 46,))
              ],
            ),
            kSpacingItem4,
            Text("Descriptrion",style: AppTypography.bodyText1.copyWith(fontWeight: FontWeight.w900),),
            kSpacingItem2,
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                child: ExpandableText(
                  widget.productDto.descriptions,
                  expandText: 'detail',
                  collapseText: 'show less',
                  maxLines: 6,
                  style: AppTypography.bodyText2.copyWith(color: const Color(0xffA1A1A1), fontWeight: FontWeight.w500),
                  linkColor: Colors.black,
                ),
              ),
            ),
            kSpacingItem2,
            Text("SELECT SIZE",style: AppTypography.bodyText1.copyWith(fontWeight: FontWeight.w900),),
            kSpacingItem2,
            SelectSizeWidget(widget.productDto.sizes),
            kSpacingItem4,
            Container(
              height: 48,
              child: ElevatedButton(
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.icBasket, width: 18, height: 18, color: Colors.white,),
                    const SizedBox(width: 16,),
                    const Text("ADD TO CART")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}