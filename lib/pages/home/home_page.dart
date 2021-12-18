import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/home/home_product_data_source.dart';
import 'package:flutter_application/widgets/app_widget/product_widget.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_application/widgets/design_system/tabbar_custom.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icon_badge_widget.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProductDataSource dataSource;

  @override
  void initState() {
    dataSource = HomeProductDataSource("popular");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              titleSpacing: 0,
              title: Container(
                height: 60,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24
                ),
                child: Row(
                  children: [
                    Text("Geeta.", style: AppTypography.header4),
                    const Spacer(),
                    IconBadgeWidget(SvgPicture.asset(Assets.icons.icNotification, width: 24, height: 24,), countBadge: 5,),
                    const SizedBox(width: 24,),
                    IconBadgeWidget(SvgPicture.asset(Assets.icons.icBasket, width: 24, height: 24,), countBadge: 3,),
                    const SizedBox(width: 24,),
                    IconBadgeWidget(SvgPicture.asset(Assets.icons.icHeart, width: 24, height: 24,),),
                    const SizedBox(width: 24,),
                    IconBadgeWidget(SvgPicture.asset(Assets.icons.icSearch, width: 24, height: 24,),),
                    const SizedBox(width: 24,),
                    IconBadgeWidget(SvgPicture.asset(Assets.icons.icMenu, width: 24, height: 24,),),
                  ],
                ),
              ),
              pinned: false,
              floating: true,
              snap: true,
            ),
            SliverAppBar(
              elevation: 0,
              titleSpacing: 0,
              title: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24
                ),
                alignment: Alignment.bottomCenter,
                child:const TabBarCustom(
                    items: ["Popular", "Mens", "Womens", "Sale",]
                ),
              ),
              pinned: true,
              floating: false,
              snap: false,
            ),
            SliverAppBar(
              elevation: 0,
              titleSpacing: 0,
              title: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24
                ).copyWith(bottom: 8),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text("FILTER & SORT", style: AppTypography.bodyText1.copyWith(fontWeight: FontWeight.bold),),
                    const SizedBox(width: 12,),
                    SvgPicture.asset(Assets.icons.icSort,width: 24, height: 24,),
                    const Spacer(),
                    SvgPicture.asset(Assets.icons.icGridview, width: 18, height: 18,),
                    const SizedBox(width: 8,),
                    SvgPicture.asset(Assets.icons.icFullview, width: 18, height: 18,),
                  ],
                ),
              ),
              pinned: true,
              floating: false,
              snap: false,
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 16
          ).copyWith(bottom: 0),
          child: paging.PagingGridView<ProductDto>(
            delegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 2/3
            ),
            pageDataSource: dataSource,
            itemBuilder: (context, productDto, index){
              return ProductWidget(productDto.id);
            },
          ),
        ),
      ),
      // body: buildContent(),
    );
  }
}

