import 'dart:io';

import 'package:flutter/material.dart';

import '../models/models.dart';

class GetImage extends StatelessWidget {
  const GetImage({
    Key? key,
    required this.pictureUrl,
  }) : super(key: key);

  final String? pictureUrl;

  @override
  Widget build(BuildContext context) {
    if (pictureUrl == null) {
      return Image(
        image: Assets.images.noImagePng,
        fit: BoxFit.cover,
      );
    }
    if (pictureUrl!.startsWith('https')) {
      return FadeInImage(
        image: NetworkImage(pictureUrl!),
        placeholder: Assets.images.jarLoadingGif,
        fit: BoxFit.cover,
      );
    }
    return Image.file(
      File(pictureUrl!),
      fit: BoxFit.cover,
    );
  }
}
