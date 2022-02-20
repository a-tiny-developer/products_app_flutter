class Assets {
  static const images = _Images();
  static const networkImages = _NetworkImages();
}

class _Images {
  final jarLoading = 'assets/images/jar-loading.gif';
  final noImage = 'assets/images/no-image.png';

  const _Images();
}

class _NetworkImages {
  final placeholder400x300 = 'https://via.placeholder.com/400x300/f6f6f6';
  const _NetworkImages();
}
