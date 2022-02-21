import 'package:flutter/material.dart';

class Assets {
  static const images = _Images();
  static const networkImages = _NetworkImages();
}

class _Images {
  final jarLoadingGif = const AssetImage('assets/images/jar-loading.gif');
  final noImagePng = const AssetImage('assets/images/no-image.png');

  const _Images();
}

class _NetworkImages {
  final placeholder400x300f6f6f6 =
      const NetworkImage('https://via.placeholder.com/400x300/f6f6f6');
  final placeholder400x300Green =
      const NetworkImage('https://via.placeholder.com/400x300/green');
  const _NetworkImages();
}
