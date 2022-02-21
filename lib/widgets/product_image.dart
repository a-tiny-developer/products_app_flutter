import 'dart:io';

import 'package:flutter/material.dart';
import 'package:products_app_flutter/models/assets_paths.dart';
import 'package:products_app_flutter/theme/theme.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      color: Colors.black,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppTheme.valueRadius),
        topRight: Radius.circular(AppTheme.valueRadius),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, 5),
        )
      ],
    );
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      width: double.infinity,
      height: 450,
      decoration: boxDecoration,
      child: Opacity(
        opacity: 0.9,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppTheme.valueRadius),
            topRight: Radius.circular(AppTheme.valueRadius),
          ),
          child: _GetImage(picture: imageUrl),
        ),
      ),
    );
  }
}

class _GetImage extends StatelessWidget {
  const _GetImage({
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
