import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:sizer/sizer.dart';

class TextForm extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? textColor;
  final Color? hintColor;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? height;
  final String? fontfamily;
  final TextOverflow? overFlow;
  final TextEditingController? controller;

  const TextForm({
    Key? key,
    required this.title,
    this.fontSize,
    this.textColor = AppColors.gray7,
    this.hintColor = AppColors.gray,
    this.fontWeight,
    this.textAlign = TextAlign.center,
    this.height,
    this.decoration,
    this.maxLines,
    this.overFlow,
    this.fontfamily,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      cursorColor: AppColors.teal,
      cursorWidth: 1,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        contentPadding: EdgeInsets.all(20.0),
        // border: const OutlineInputBorder(),
        border: InputBorder.none,
      ),
      style: TextStyle(
          fontSize: fontSize ?? 14.sp,
          color: textColor,
          fontWeight: fontWeight,
          decoration: decoration,
          overflow: overFlow,
          fontFamily: fontfamily,
          height: height),
      textAlign: textAlign!,
    );
  }
}
