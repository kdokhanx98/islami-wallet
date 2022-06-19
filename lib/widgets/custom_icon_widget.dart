import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:sizer/sizer.dart';

class CustomIconWidget extends StatelessWidget {
  final void Function()? onTap;
  final Color? iconColor;
  final Color? containerColor;
  final Color borderColor;
  final String svgName;
  const CustomIconWidget(
      {Key? key,
      this.onTap,
      this.iconColor = Colors.white,
      this.containerColor = Colors.transparent,
      required this.svgName,
      this.borderColor = AppColors.gray})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap ?? () => context.router.pop(),
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(15),
            color: containerColor),
        child: SvgPicture.asset(
          'assets/svg/$svgName.svg',
          color: iconColor,
        ),
      ),
    );
  }
}
