/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/branding
  $AssetsImagesBrandingGen get branding => const $AssetsImagesBrandingGen();

  /// Directory path: assets/images/reactions
  $AssetsImagesReactionsGen get reactions => const $AssetsImagesReactionsGen();

  /// Directory path: assets/images/scents
  $AssetsImagesScentsGen get scents => const $AssetsImagesScentsGen();
}

class $AssetsImagesBrandingGen {
  const $AssetsImagesBrandingGen();

  /// File path: assets/images/branding/logo.png
  AssetGenImage get logo =>
      const AssetGenImage('assets/images/branding/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsImagesReactionsGen {
  const $AssetsImagesReactionsGen();

  /// File path: assets/images/reactions/angry.png
  AssetGenImage get angry =>
      const AssetGenImage('assets/images/reactions/angry.png');

  /// File path: assets/images/reactions/disgusted.png
  AssetGenImage get disgusted =>
      const AssetGenImage('assets/images/reactions/disgusted.png');

  /// File path: assets/images/reactions/happy.png
  AssetGenImage get happy =>
      const AssetGenImage('assets/images/reactions/happy.png');

  /// File path: assets/images/reactions/neutral.png
  AssetGenImage get neutral =>
      const AssetGenImage('assets/images/reactions/neutral.png');

  /// File path: assets/images/reactions/pleased.png
  AssetGenImage get pleased =>
      const AssetGenImage('assets/images/reactions/pleased.png');

  /// File path: assets/images/reactions/unhappy.png
  AssetGenImage get unhappy =>
      const AssetGenImage('assets/images/reactions/unhappy.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [angry, disgusted, happy, neutral, pleased, unhappy];
}

class $AssetsImagesScentsGen {
  const $AssetsImagesScentsGen();

  /// File path: assets/images/scents/chamomile.png
  AssetGenImage get chamomile =>
      const AssetGenImage('assets/images/scents/chamomile.png');

  /// File path: assets/images/scents/cinnamon.png
  AssetGenImage get cinnamon =>
      const AssetGenImage('assets/images/scents/cinnamon.png');

  /// File path: assets/images/scents/citronella.png
  AssetGenImage get citronella =>
      const AssetGenImage('assets/images/scents/citronella.png');

  /// File path: assets/images/scents/clove.png
  AssetGenImage get clove =>
      const AssetGenImage('assets/images/scents/clove.png');

  /// File path: assets/images/scents/eucalyptus.png
  AssetGenImage get eucalyptus =>
      const AssetGenImage('assets/images/scents/eucalyptus.png');

  /// File path: assets/images/scents/garlic.png
  AssetGenImage get garlic =>
      const AssetGenImage('assets/images/scents/garlic.png');

  /// File path: assets/images/scents/grapefruit.png
  AssetGenImage get grapefruit =>
      const AssetGenImage('assets/images/scents/grapefruit.png');

  /// File path: assets/images/scents/lavender.png
  AssetGenImage get lavender =>
      const AssetGenImage('assets/images/scents/lavender.png');

  /// File path: assets/images/scents/lemon.png
  AssetGenImage get lemon =>
      const AssetGenImage('assets/images/scents/lemon.png');

  /// File path: assets/images/scents/mint.png
  AssetGenImage get mint =>
      const AssetGenImage('assets/images/scents/mint.png');

  /// File path: assets/images/scents/orange.png
  AssetGenImage get orange =>
      const AssetGenImage('assets/images/scents/orange.png');

  /// File path: assets/images/scents/rose.png
  AssetGenImage get rose =>
      const AssetGenImage('assets/images/scents/rose.png');

  /// File path: assets/images/scents/rosemary.png
  AssetGenImage get rosemary =>
      const AssetGenImage('assets/images/scents/rosemary.png');

  /// File path: assets/images/scents/teatree.png
  AssetGenImage get teatree =>
      const AssetGenImage('assets/images/scents/teatree.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        chamomile,
        cinnamon,
        citronella,
        clove,
        eucalyptus,
        garlic,
        grapefruit,
        lavender,
        lemon,
        mint,
        orange,
        rose,
        rosemary,
        teatree
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
