
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/data/blocs/basket_bloc/basket_bloc.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/data/repositories/basket_repository_impl.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/home/basket_page/basket_item_widget.dart';
import 'package:flutter_application/pages/home/basket_page/basket_product_data_source.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkout_widget.dart';

class BasketPage extends StatefulWidget {
  static const ROUTE_NAME = 'BasketPage';

  const BasketPage({Key? key}) : super(key: key);
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  static const TAG = 'BasketPage';
  late BasketProductDataSource dataSource;

  @override
  void initState() {
    dataSource = BasketProductDataSource();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: const EdgeInsets.symmetric(
            vertical: 48, horizontal: 24
        ).copyWith(bottom: 0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkResponse(
                              onTap: (){
                                context.read<BasketBloc>().emit({});
                                Navigator.of(context).pop();
                              },
                              child: SvgPicture.asset(Assets.icons.icBackArrowBlack, width: 18, height: 18,)))),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("My Card", style: AppTypography.header3.copyWith(fontWeight: FontWeight.w900),)))
                ],
              ),
            ),
            kSpacingItem,
            Expanded(child: paging.PagingListView<ProductDto>(
              pageDataSource: dataSource,
              isEnablePullToRefresh: false,
              separatorBuilder: (context, index)=>SizedBox.shrink(),
              itemBuilder: (context, productDto, index){
                return BasketItemWidget(productDto.id);
              },
            )),
            CheckoutWidget(),
          ],
        ),
      )
    );
  }
  @override
  void dispose() {
    BasketRepositoryImpl.countItemHasResponse = 0;
    super.dispose();
  }
}