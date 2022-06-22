import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../theme/colors.dart';

class SettingsItem extends StatelessWidget {
  final String svgIconName;
  final String title;
  final String subtitle;
  final bool isArrowShown;
  final void Function()? onTap;
  const SettingsItem(
      {Key? key,
      required this.svgIconName,
      required this.title,
      this.subtitle = '',
      this.isArrowShown = true, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      onTap: onTap,
      radius: 20,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      containerColor: AppColors.gray3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/$svgIconName.svg',
                width: 34,
                height: 34,
              ),
              SizedBox(
                width: 4.w,
              ),
              TextWidget(
                title: title,
                textColor: Colors.white,
                fontSize: 16.sp,
              )
            ],
          ),
          Row(
            children: [
              TextWidget(
                title: subtitle,
              ),
              SizedBox(
                width: 2.w,
              ),
              if (isArrowShown)
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 20,
                )
            ],
          ),
        ],
      ),
    );
  }
}
