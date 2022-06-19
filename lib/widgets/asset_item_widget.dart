import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class AssetItemWidget extends StatelessWidget {
  final String svgPathName;
  final String title;
  final String subtitle;
  final String subtitlePercentage;
  final String trailingTitle;
  final String trailingSubtitle;
  final Color iconContainerColor;
  const AssetItemWidget(
      {Key? key,
      required this.svgPathName,
      required this.title,
      required this.subtitle,
      required this.trailingTitle,
      required this.trailingSubtitle,
      required this.subtitlePercentage,
      required this.iconContainerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: RoundedContainer(
        onTap: () {
          // view the coin details
          log('item with titlie $title was tapped');
        },
        radius: 20,
        containerColor: AppColors.gray3,
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: ListTile(
          horizontalTitleGap: 1.6.w,
          leading: Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: iconContainerColor),
            child: SvgPicture.asset(
              'assets/svg/$svgPathName.svg',
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: TextWidget(
              title: title,
              textAlign: TextAlign.start,
              maxLines: 1,
              textColor: Colors.white,
            ),
          ),
          subtitle: RichText(
            textAlign: TextAlign.start,
            maxLines: 1,
            text: TextSpan(
              children: [
                TextSpan(
                    text: subtitle,
                    style: TextStyle(
                      color: AppColors.gray,
                      fontSize: 12.sp,
                    )),
                TextSpan(
                  text: subtitlePercentage,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: () {
                      if (subtitlePercentage.contains('-')) {
                        return AppColors.red2;
                      } else {
                        return AppColors.green2;
                      }
                    }(),
                  ),
                ),
              ],
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextWidget(
                title: trailingTitle,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                maxLines: 1,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextWidget(
                maxLines: 1,
                title: trailingSubtitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
