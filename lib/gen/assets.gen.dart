/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  String get homeBlack24dp => 'assets/icons/home_black_24dp.svg';
  String get icBackArrow => 'assets/icons/ic_back_arrow.svg';
  String get icCheckbox => 'assets/icons/ic_checkbox.svg';
  String get icCheckedbox => 'assets/icons/ic_checkedbox.svg';
  String get icEmail => 'assets/icons/ic_email.svg';
  String get icLock => 'assets/icons/ic_lock.svg';
  String get icWarningCircleBlack => 'assets/icons/ic_warning_circle_black.svg';
  String get icWarningCirclePuple => 'assets/icons/ic_warning_circle_puple.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get loading => const AssetGenImage('assets/images/loading.png');
  AssetGenImage get loading2 =>
      const AssetGenImage('assets/images/loading_2.png');
  AssetGenImage get loading3 =>
      const AssetGenImage('assets/images/loading_3.png');
  AssetGenImage get roundHomeBlack24dp =>
      const AssetGenImage('assets/images/round_home_black_24dp.png');
  AssetGenImage get selectOptionPage =>
      const AssetGenImage('assets/images/select_option_page.png');
  AssetGenImage get signup => const AssetGenImage('assets/images/signup.png');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
