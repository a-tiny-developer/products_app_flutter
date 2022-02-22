import 'dart:io';

import 'package:flutter/material.dart';

import '../models/models.dart';

class GetImage extends StatelessWidget {
  const GetImage({
    Key? key,
    required this.picture,
  }) : super(key: key);

  final String? picture;

  @override
  Widget build(BuildContext context) {
    if (picture == null) {
      return Image(
        image: Assets.images.noImagePng,
        fit: BoxFit.cover,
      );
    }
    if (picture!.startsWith('https')) {
      return FadeInImage(
        image: NetworkImage(picture!),
        placeholder: Assets.images.jarLoadingGif,
        fit: BoxFit.cover,
      );
    }
    return Image.file(
      File(picture!),
      fit: BoxFit.cover,
    );
  }
}
