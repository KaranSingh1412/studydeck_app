import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, this.imageUrl, this.height, this.fit});
  final String? imageUrl;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            height: height,
            fit: fit,
          )
        : const SizedBox();
  }
}
