import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? height;
  final String? fontfamily;
  final TextOverflow? overFlow;
  const TextWidget(
      {Key? key,
      required this.title,
      this.fontSize,
      this.textColor = Colors.white,
      this.fontWeight,
      this.textAlign,
      this.height,
      this.decoration,
      this.maxLines,
      this.overFlow,
      this.fontfamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: fontSize ?? 11.sp,
          color: textColor,
          fontWeight: fontWeight,
          decoration: decoration,
          overflow: overFlow,
          fontFamily: fontfamily,
          height: height),
      textAlign: textAlign,
    );
  }
}
