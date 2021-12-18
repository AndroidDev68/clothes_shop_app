/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  String get homeBlack24dp => 'assets/icons/home_black_24dp.svg';
  String get icBackArrow => 'assets/icons/ic_back_arrow.svg';
  String get icBackArrowBlack => 'assets/icons/ic_back_arrow_black.svg';
  String get icBasket => 'assets/icons/ic_basket.svg';
  String get icCheckbox => 'assets/icons/ic_checkbox.svg';
  String get icCheckedbox => 'assets/icons/ic_checkedbox.svg';
  String get icEmail => 'assets/icons/ic_email.svg';
  String get icFullview => 'assets/icons/ic_fullview.svg';
  String get icGridview => 'assets/icons/ic_gridview.svg';
  String get icHeart => 'assets/icons/ic_heart.svg';
  String get icLock => 'assets/icons/ic_lock.svg';
  String get icMenu => 'assets/icons/ic_menu.svg';
  String get icMinus => 'assets/icons/ic_minus.svg';
  String get icNotification => 'assets/icons/ic_notification.svg';
  String get icPlus => 'assets/icons/ic_plus.svg';
  String get icSearch => 'assets/icons/ic_search.svg';
  String get icShare => 'assets/icons/ic_share.svg';
  String get icSort => 'assets/icons/ic_sort.svg';
  String get icStarGray => 'assets/icons/ic_star_gray.svg';
  String get icStarYellow => 'assets/icons/ic_star_yellow.svg';
  String get icTickWhite => 'assets/icons/ic_tick_white.svg';
  String get icUser => 'assets/icons/ic_user.svg';
  String get icWarningCircleBlack => 'assets/icons/ic_warning_circle_black.svg';
  String get icWarningCirclePuple => 'assets/icons/ic_warning_circle_puple.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get jacket12 =>
      const AssetGenImage('assets/images/jacket_12.png');
  AssetGenImage get jacket13 =>
      const AssetGenImage('assets/images/jacket_13.png');
  AssetGenImage get jacket14 =>
      const AssetGenImage('assets/images/jacket_14.png');
  String get jacket15 => 'assets/images/jacket_15.ico';
  AssetGenImage get jacket16 =>
      const AssetGenImage('assets/images/jacket_16.png');
  AssetGenImage get jacket3 =>
      const AssetGenImage('assets/images/jacket_3.png');
  AssetGenImage get jacket33 =>
      const AssetGenImage('assets/images/jacket_33.png');
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
