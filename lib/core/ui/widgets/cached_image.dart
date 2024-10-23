import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../constant/app_images/app_images.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? radius;
  final double? placeHolderHeight;
  final double? width;
  final int? cacheWidth;
  final int? cacheHeight;
  final Color? color;
  final String? fallbackPlaceHolder;
  final bool removeOnDispose;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.height,
    this.radius,
    this.placeHolderHeight,
    this.width,
    this.cacheHeight,
    this.cacheWidth,
    this.color,
    this.fallbackPlaceHolder,
    this.removeOnDispose = true,
  });

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      imageUrl ?? '',
      fit: fit,
      borderRadius:  BorderRadius.all(Radius.circular(radius??0)),
      height: height,
      width: width,
      color: color,
      printError: false,
      cacheMaxAge: const Duration(days: 365),
      clearMemoryCacheWhenDispose: removeOnDispose,
      handleLoadingProgress: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Padding(
              padding:  EdgeInsets.all(radius??0.0),
              child: ExtendedImage(
                borderRadius:  BorderRadius.all(Radius.circular(radius??0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                image: const AssetImage(logoPngImage),
                clearMemoryCacheWhenDispose: true,
                fit: BoxFit.fill,
              ),
            );
          case LoadState.completed:
            return state.completedWidget;
          case LoadState.failed:
            return Padding(
              padding:  EdgeInsets.all(radius??0.0),
              child: ExtendedImage(
                borderRadius:  BorderRadius.all(Radius.circular(radius??0)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                image: const AssetImage(logoPngImage),
                clearMemoryCacheWhenDispose: true,
                fit: BoxFit.fill,
                color: color,
              ),
            );
        }
      },
    );
  }
}