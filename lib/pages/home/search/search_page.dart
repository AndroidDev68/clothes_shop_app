
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:flutter_application/data/blocs/home/view_mode.dart';
import 'package:flutter_application/data/dto/product_dto.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/home/home_product_data_source.dart';
import 'package:flutter_application/widgets/app_widget/product_widget.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_application/widgets/form/app_search_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = 'SearchPage';

  const SearchPage();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static const TAG = 'SearchPage';
  HomeProductDataSource? dataSource;

  onGetProductWithName(String suggest){
    dataSource = HomeProductDataSource(suggestName: suggest);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 24,vertical: 48
          ).copyWith(bottom: 0),
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  titleSpacing: 0,
                  title: Container(
                    height: 60,
                    alignment: Alignment.center,
                    child:  SizedBox(
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
                                  child: Text("Find products", style: AppTypography.header3.copyWith(fontWeight: FontWeight.w900),)))
                        ],
                      ),
                    ),
                  ),
                  pinned: false,
                  floating: false,
                  snap: false,
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,toolbarHeight: 60,
                  titleSpacing: 0,
                  title: Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AppSearchTextFormField(
                      labelText: "Enter product name",
                      hintText: "Enter product name",
                      leadingIcon: SvgPicture.asset(Assets.icons.icTextSearch, width: 24, height: 24,),
                      onEditingComplete: (value){
                        onGetProductWithName(value);
                      },
                    ),
                  ),
                  pinned: true,
                  floating: false,
                  snap: false,
                ),
              ];
            },
            body: dataSource == null ? Container() :paging.PagingGridView<ProductDto>(
              delegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 2/3
              ),
              key: ValueKey(dataSource.hashCode),
              pageDataSource: dataSource!,
              itemBuilder: (context, productDto, index){
                return ProductWidget(productDto.id, ViewMode.gridview);
              },
            ) ,
          ),
        ),
      )
    );
  }
}