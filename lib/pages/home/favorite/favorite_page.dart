
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/home/favorite/favorite_list_data_source.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fl_paging/fl_paging.dart' as paging;

import '../../../constants.dart';
import 'favorite_item_widget.dart';

class FavoritePage extends StatefulWidget {
  static const ROUTE_NAME = 'FavoritePage';

  const FavoritePage();

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  static const TAG = 'FavoritePage';
  late FavoriteListDataSource dataSource;
  @override
  void initState() {
    dataSource = FavoriteListDataSource();
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
                                Navigator.of(context).pop();
                              },
                              child: SvgPicture.asset(Assets.icons.icBackArrowBlack, width: 18, height: 18,)))),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("My Favorites", style: AppTypography.header3.copyWith(fontWeight: FontWeight.w900),)))
                ],
              ),
            ),
            kSpacingItem,
            Expanded(child: paging.PagingListView<ProductDto>(
              pageDataSource: dataSource,
              isEnablePullToRefresh: false,
              itemBuilder: (context, productDto, index){
                return FavoriteItemWidget(productDto.id);
              },
            )),
          ],
        ),
      )
    );
  }
}