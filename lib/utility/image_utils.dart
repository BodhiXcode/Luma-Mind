import 'package:flutter/material.dart';

/// Utility to precache an asset image and return the AssetImage for use in widgets.
Future<AssetImage> precachedAssetImage(
  BuildContext context,
  String assetPath,
) async {
  final image = AssetImage(assetPath);
  await precacheImage(image, context);
  return image;
}
