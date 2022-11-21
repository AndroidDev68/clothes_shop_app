
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';

import 'tabbar_item_custom.dart';

class TabBarCustom extends StatefulWidget {
  static const ROUTE_NAME = 'TabbarCustom';
  final ValueChanged<MapEntry<int,String>>? onChange;
  final List<String> items;
  const TabBarCustom({Key? key, required this.items ,this.onChange}) : super(key: key);
  @override
  _TabBarCustomState createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom> {
  static const TAG = 'TabbarCustom';
  int selectedIndex = 0;

  changeSelectedIndex(MapEntry<int, String> data){
    selectedIndex = data.key;
    if(widget.onChange != null){
      widget.onChange!(data);
    }
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Row(
            children: widget.items.asMap().entries.map((e) => InkWell(
              onTap: (){
                changeSelectedIndex(e);
              },
              child: Row(
                children: [
                  TabBarItemCustom(e.value,
                    titleColor: e.key == selectedIndex ? colorAccent : const Color(0xffA1A1A1),
                    indicatorColor: e.key == selectedIndex ? colorAccent : Colors.transparent,
                  ),
                  const SizedBox(width: 40,)
                ],
              ),
            )).toList(),
          ),
         const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Divider(height: 2, color: Color(0xffF1F4FB), thickness: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

}


