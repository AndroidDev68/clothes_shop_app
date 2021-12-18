
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectSizeWidget extends StatefulWidget {
  List<String> listSize;

  SelectSizeWidget(this.listSize);

  @override
  _SelectSizeWidgetState createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.listSize.asMap().entries
          .map((e) => buildContent(widget.listSize[e.key], e.key ,indexSelected == e.key ? true: false)).toList(),
    );
  }

  Widget buildContent(String sizeName, int index ,bool selected){
    return InkResponse(
      onTap: (){
        indexSelected = index;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: selected ? colorAccent : const Color(0xffF1F4FB)
        ),
        width: 48,
        height: 48,
        child: Stack(
          children: [
            Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child:Text(sizeName,
                    style: AppTypography.title.copyWith(fontWeight: FontWeight.normal, color: selected ? Colors.white : Colors.black),) ,
              ),
            ),
            if(selected)
              Positioned.fill(
                top: 4,
                right: 4,
                child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(Assets.icons.icTickWhite, width: 16, height: 16,) ,
                ),
              ),
          ],
        ),
      ),
    );
  }


}