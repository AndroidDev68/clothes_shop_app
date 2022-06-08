import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:flutter/material.dart';
import 'package:flutter_application/data/blocs/home/home_bloc.dart';
import 'package:flutter_application/data/blocs/home/home_state.dart';
import 'package:flutter_application/data/blocs/home/view_mode.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/home/basket_page/basket_page.dart';
import 'package:flutter_application/pages/home/favorite/favorite_page.dart';
import 'package:flutter_application/pages/home/home_product_data_source.dart';
import 'package:flutter_application/pages/home/search/search_page.dart';
import 'package:flutter_application/widgets/app_widget/app_error_widget.dart';
import 'package:flutter_application/widgets/app_widget/app_loading_widget.dart';
import 'package:flutter_application/widgets/app_widget/product_widget.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_application/widgets/design_system/tabbar_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'drawe_end.dart';
import 'icon_badge_widget.dart';
import 'dart:developer' as developer;

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
    dataSource = HomeProductDataSource(type: "popular");
    context.read<HomeBloc>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log("value: rebuild home", name: 'tz');
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: DraweEnd(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          developer.log("value: BlocBuilder build", name: 'tz');
          return state.when(
              (notificationCount, basketCount, viewMode, productData) {
            developer.log("value: BlocBuilder newstate != oldstate",
                name: 'tz');
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    elevation: 0,
                    titleSpacing: 0,
                    title: Container(
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Text("Geeta.", style: AppTypography.header4),
                          const Spacer(),
                          IconBadgeWidget(
                            SvgPicture.asset(
                              Assets.icons.icNotification,
                              width: 24,
                              height: 24,
                            ),
                            countBadge: notificationCount,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          InkResponse(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, BasketPage.ROUTE_NAME);
                              },
                              child: IconBadgeWidget(
                                SvgPicture.asset(
                                  Assets.icons.icBasket,
                                  width: 24,
                                  height: 24,
                                ),
                                countBadge: basketCount,
                              )),
                          const SizedBox(
                            width: 24,
                          ),
                          InkResponse(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, FavoritePage.ROUTE_NAME);
                              },
                              child: IconBadgeWidget(
                                SvgPicture.asset(
                                  Assets.icons.icHeart,
                                  width: 24,
                                  height: 24,
                                ),
                              )),
                          const SizedBox(
                            width: 24,
                          ),
                          InkResponse(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SearchPage.ROUTE_NAME);
                              },
                              child: IconBadgeWidget(
                                SvgPicture.asset(
                                  Assets.icons.icSearch,
                                  width: 24,
                                  height: 24,
                                ),
                              )),
                          const SizedBox(
                            width: 24,
                          ),
                          InkResponse(
                              onTap: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              child: IconBadgeWidget(
                                SvgPicture.asset(
                                  Assets.icons.icMenu,
                                  width: 24,
                                  height: 24,
                                ),
                              )),
                        ],
                      ),
                    ),
                    actions: <Widget>[Container()],
                    pinned: false,
                    floating: true,
                    snap: true,
                  ),
                  SliverAppBar(
                    elevation: 0,
                    titleSpacing: 0,
                    title: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      alignment: Alignment.bottomCenter,
                      child: TabBarCustom(
                        items: const [
                          "Popular",
                          "Mens",
                          "Womens",
                          "Sale",
                        ],
                        onChange: (MapEntry<int, String> data) {
                          developer.log("value: onchange data", name: 'tz');
                          dataSource = HomeProductDataSource(type: data.value);
                          setState(() {});
                        },
                      ),
                    ),
                    actions: <Widget>[Container()],
                    pinned: true,
                    floating: false,
                    snap: false,
                  ),
                  SliverAppBar(
                    elevation: 0,
                    titleSpacing: 0,
                    title: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 24)
                          .copyWith(bottom: 8),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Text(
                            "FILTER & SORT",
                            style: AppTypography.bodyText1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset(
                            Assets.icons.icSort,
                            width: 24,
                            height: 24,
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                context
                                    .read<HomeBloc>()
                                    .changeViewMode(ViewMode.gridview);
                              },
                              child: SvgPicture.asset(
                                Assets.icons.icGridview,
                                width: 18,
                                height: 18,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                              onTap: () {
                                context
                                    .read<HomeBloc>()
                                    .changeViewMode(ViewMode.listview);
                              },
                              child: SvgPicture.asset(
                                Assets.icons.icFullview,
                                width: 18,
                                height: 18,
                              )),
                        ],
                      ),
                    ),
                    actions: <Widget>[Container()],
                    pinned: true,
                    floating: false,
                    snap: false,
                  ),
                ];
              },
              body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16)
                        .copyWith(bottom: 0),
                child: viewMode == ViewMode.gridview
                    ? paging.PagingGridView<ProductDto>(
                        delegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 2 / 3),
                        key: ValueKey(dataSource.hashCode),
                        pageDataSource: dataSource,
                        itemBuilder: (context, productDto, index) {
                          return ProductWidget(productDto.id, viewMode);
                        },
                      )
                    : paging.PagingListView<ProductDto>(
                        pageDataSource: dataSource,
                        key: ValueKey(dataSource.hashCode),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemBuilder: (context, productDto, index) {
                          return ProductWidget(productDto.id, viewMode);
                        },
                      ),
              ),
            );
          },
              loading: () => AppLoadingWidget(),
              error: (errorMessage) => AppErrorWidget(errorMessage));
        },
      ),
    );
  }
}
