import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/data/blocs/home/home_bloc.dart';
import 'package:flutter_application/data/blocs/home/home_state.dart';
import 'package:flutter_application/data/blocs/home/view_mode.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/home/product_detail/product_detail_page.dart';
import 'package:flutter_application/widgets/app_widget/app_error_widget.dart';
import 'package:flutter_application/widgets/app_widget/app_loading_widget.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
  int productId;
  ViewMode viewMode;

  ProductWidget(this.productId, this.viewMode);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(builder: (context, state){
      return state.when((notificationCount, basketCount, viewMode, productData){
        if(productData.containsKey(productId.toString())){
          ProductDto productDto = productData[productId.toString()]!;
          return InkResponse(
            onTap: (){
              Navigator.pushNamed(context, ProductDetailPage.ROUTE_NAME, arguments: productId);
            },
            child: viewMode == ViewMode.gridview ?
              _buildItemGirdView(productDto) : _buildItemListView(productDto),
          );
        }else{
          return Container();
        }
      }, loading: ()=>AppLoadingWidget(),
          error: (errorMessage)=>AppErrorWidget(errorMessage));
    });
  }
  Widget _buildItemGirdView(ProductDto productDto){
    return  SizedBox(
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
    );
  }
  Widget _buildItemListView(ProductDto productDto){
    return  Container(
      height: 146,
      decoration: BoxDecoration(
        color: const Color(0xffF1F4FB),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(productDto.image, width: 80,),
          const SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(productDto.name, style: AppTypography.header3.copyWith(fontWeight: FontWeight.w900),),
                kSpacingItem2,
                Text(productDto.productCategory, style: AppTypography.title.copyWith(color: const Color(0xffA1A1A1)),),
                const SizedBox(height: 4,),
                Text(productDto.descriptions, maxLines: 3, style: AppTypography.bodyText2.copyWith(color: const Color(0xffA1A1A1)),),
                kSpacingItem3,
                Text(productDto.price, style: AppTypography.header3,)
              ],
            ),
          ),
          SvgPicture.asset(Assets.icons.icHeart, width: 24,height: 24,),
        ],
      ),
    );
  }
}