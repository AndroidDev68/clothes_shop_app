
import 'dart:developer' as developer;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';

import '../../constants.dart';

class IntroPage extends StatefulWidget {
  static const ROUTE_NAME = 'IntroPage';
  final VoidCallback callback;

  const IntroPage(this.callback);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  static const TAG = 'IntroPage';
  var introImages = [
    Assets.images.loading.path,
    Assets.images.loading2.path,
    Assets.images.loading3.path,

  ];
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                onPageChanged: (index, reason){
                  _current = index;
                  setState(() {});
                }
              ),
              carouselController: _controller,
              items: introImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(i,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,)
                    );
                  },
                );
              }).toList(),
            ),
            Positioned.fill(
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Geeta.", style: AppTypography.header6.copyWith(fontSize: 104, color: Colors.white),),
                    kSpacingItem3,
                    Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: (){
                          widget.callback();
                        },
                        borderRadius: BorderRadius.circular(56),
                        splashColor: Colors.black,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(56),
                            border: Border.all(color: Colors.white, width: 2)
                          ),
                          padding: kPadding[3],
                          child: Text("SHOP NOW", style: AppTypography.button.copyWith(color: Colors.white),),
                        ),
                      ),
                    ),
                    kSpacingItem6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: introImages.asMap().entries.map((entry) {
                        return Container(
                          width: _current == entry.key ? 24.0 : 6.0,
                          height: 6.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                              shape: BoxShape.rectangle,
                              color: Colors.white),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}