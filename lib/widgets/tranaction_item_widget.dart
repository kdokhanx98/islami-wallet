import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/screens/dashboard/wallet/view_coin_screen.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../theme/colors.dart';

class TransactionItemWidget extends StatelessWidget {
  final TransactionStatus status;
  final TransactionResult result;
  const TransactionItemWidget(
      {Key? key, required this.status, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: RoundedContainer(
        onTap: () {},
        radius: 20,
        containerColor: AppColors.gray3,
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: ListTile(
          horizontalTitleGap: 4.w,
          leading: Container(
            padding: EdgeInsets.all(3.w),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.gray10),
            child: SvgPicture.asset(
              'assets/svg/${() {
                switch (status) {
                  case TransactionStatus.sent:
                    return 'ic_send';
                  case TransactionStatus.received:
                    return 'ic_receive';
                }
              }()}.svg',
              color: AppColors.gray11,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: TextWidget(
              title: () {
                switch (status) {
                  case TransactionStatus.sent:
                    return 'Sent';
                  case TransactionStatus.received:
                    return 'Received';
                }
              }(),
              textAlign: TextAlign.start,
              maxLines: 1,
              textColor: Colors.white,
            ),
          ),
          subtitle: TextWidget(
            title: () {
              switch (result) {
                case TransactionResult.conirmed:
                  return 'Confirmed';
                case TransactionResult.failed:
                  return 'Failed';
                case TransactionResult.pending:
                  return 'Pending';
              }
            }(),
            textAlign: TextAlign.start,
            maxLines: 1,
            textColor: () {
              switch (result) {
                case TransactionResult.conirmed:
                  return AppColors.green2;
                case TransactionResult.failed:
                  return AppColors.red2;
                case TransactionResult.pending:
                  return AppColors.orange3;
              }
            }(),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const TextWidget(
                title: '1000 ISLAMI',
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                maxLines: 1,
              ),
              SizedBox(
                height: 1.h,
              ),
              const TextWidget(
                maxLines: 1,
                title: '\$25.17216',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
