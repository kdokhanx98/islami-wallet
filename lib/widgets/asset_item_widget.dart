import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/models/wallet_coin.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import 'coin_image.dart';

class AssetItemWidget extends StatelessWidget {
  final String? itemImage;
  final String svgPathName;
  final String title;
  final String subtitle;
  final String subtitlePercentage;
  final String trailingTitle;
  final String trailingSubtitle;
  final Color iconContainerColor;
  final int index;
  final WalletCoin coin;

  const AssetItemWidget(
      {Key? key,
      this.itemImage,
      required this.svgPathName,
      required this.title,
      required this.subtitle,
      required this.trailingTitle,
      required this.trailingSubtitle,
      required this.subtitlePercentage,
      required this.iconContainerColor,
      required this.index,
      required this.coin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: RoundedContainer(
        onTap: () =>
            context.router.push(ViewCoinRoute(index: index, coin: coin)),
        radius: 20,
        containerColor: AppColors.gray3,
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: ListTile(
          horizontalTitleGap: 1.6.w,
          leading: Container(
            padding: EdgeInsets.all(0.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: iconContainerColor),
            child: itemImage != null
                ? CoinImage(image: itemImage)
                : SvgPicture.asset(
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
                  text: ' ($subtitlePercentage)',
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
