import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoinImage extends StatelessWidget {
  final String? image;
  final Icon? icon;
  final Color? bgColor;

  CoinImage({this.image, this.icon, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor ?? Theme.of(context).cardColor,
      ),
      // child: icon ?? Image.asset(image!),
      child: icon ??
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: (image == null || image == '')
                      ? null
                      : DecorationImage(
                          image: CachedNetworkImageProvider(
                            image!,
                            errorListener: () {
                              //this is never called when running on the web!
                              log("CachedNetworkImageProvider: Image failed to load!");
                            },
                          ),
                          scale: 0.1))),
    );
  }
}
