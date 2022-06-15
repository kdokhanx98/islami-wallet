import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:sizer/sizer.dart';

class CustomPagesBack extends StatelessWidget {
  final void Function()? onTap;
  final Color? arrowColor;
  final Color? containerColor;
  const CustomPagesBack(
      {Key? key,
      this.onTap,
      this.arrowColor = Colors.white,
      this.containerColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.router.pop(),
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.gray,
            ),
            borderRadius: BorderRadius.circular(15),
            color: containerColor),
        child: Icon(
          Icons.arrow_back,
          color: arrowColor,
        ),
      ),
    );
  }
}
