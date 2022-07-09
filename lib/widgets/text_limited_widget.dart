import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:sizer/sizer.dart';

class TextLimitedWidget extends StatelessWidget {
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
  const TextLimitedWidget(
      {Key? key,
      required this.title,
      this.fontSize,
      this.textColor = AppColors.gray,
      this.fontWeight,
      this.textAlign = TextAlign.center,
      this.height,
      this.decoration,
      this.maxLines,
      this.overFlow,
      this.fontfamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
        fontSize: fontSize ?? 14.sp,
        color: textColor,
        fontWeight: fontWeight,
        decoration: decoration,
        overflow: overFlow,
        fontFamily: fontfamily,
        height: height);
    return Row(
      children: <Widget>[
        // const Spacer(),
        Expanded(
          child: Text(title.length > 8 ? title.substring(0, 8) + '...' : title,
              maxLines: 1,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: style),
        ),
        Expanded(
          child: Text(title.length > 8 ? title.substring(title.length - 8) : '',
              maxLines: 1, textAlign: TextAlign.start, style: style),
        ),
        // const Spacer(),
      ],
    );
  }
}
