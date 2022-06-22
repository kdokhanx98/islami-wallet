import 'package:auto_route/auto_route.dart';
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
        onTap: () {
          String transactionStatus = '';
          String transactionResult = '';
          String iconPath = '';
          bool isConfirmed = false;
          switch (result) {
            case TransactionResult.conirmed:
              transactionResult = 'Confirmed';
              iconPath = 'ic_success';
              isConfirmed = true;

              break;
            case TransactionResult.failed:
              transactionResult = 'Failed';
              iconPath = 'ic_fail';
              break;
            case TransactionResult.pending:
              transactionResult = 'Pending';
              iconPath = 'ic_pending';
              break;
          }
          switch (status) {
            case TransactionStatus.sent:
              transactionStatus = 'Sent';
              break;
            case TransactionStatus.received:
              transactionStatus = 'Received';
              break;
          }

          showModalBottomSheet<String>(
              backgroundColor: Colors.transparent,
              useRootNavigator: true,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return FractionallySizedBox(
                  heightFactor: isConfirmed ? 0.95 : 0.7,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.gray3,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          RoundedContainer(
                            width: 12.w,
                            height: 1.w,
                            containerColor: AppColors.gray5,
                            radius: 20,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          SvgPicture.asset(
                            'assets/svg/$iconPath.svg',
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Center(
                            child: TextWidget(
                              title: 'Transaction $transactionResult',
                              fontSize: 19.sp,
                              textColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          RoundedContainer(
                            radius: 30,
                            width: double.infinity,
                            containerColor: AppColors.primaryColor,
                            padding: EdgeInsets.all(5.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextWidget(
                                  title: 'Details',
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                  fontSize: 16.sp,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      title: 'TRXN. Type:',
                                      textColor: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                    TextWidget(
                                      title: transactionStatus,
                                      textColor: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      title: 'Amount',
                                      textColor: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                    TextWidget(
                                      title: 'ISLAMI 1000',
                                      textColor: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Spacer(),
                                    TextWidget(
                                      title: '\$25.17216',
                                      fontSize: 15.sp,
                                    ),
                                  ],
                                ),
                                if (isConfirmed)
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                if (isConfirmed)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        title: 'Network Fee:',
                                        textColor: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                      TextWidget(
                                        title: 'ISLAMI 10',
                                        textColor: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ],
                                  ),
                                if (isConfirmed)
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                if (isConfirmed)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Spacer(),
                                      TextWidget(
                                        title: '\$1',
                                        fontSize: 15.sp,
                                      ),
                                    ],
                                  ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    TextWidget(
                                      title: 'From:',
                                    ),
                                    TextWidget(
                                      title: '15rGLE…hsMKYP',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    TextWidget(
                                      title: 'To:',
                                    ),
                                    TextWidget(
                                      title: '85kHYd…87JKrA',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    TextWidget(
                                      title: 'Date:',
                                    ),
                                    TextWidget(
                                      title: 'May 25 at 2:17 PM',
                                    ),
                                  ],
                                ),
                                if (isConfirmed)
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                if (isConfirmed)
                                  const Divider(
                                    color: AppColors.gray,
                                    thickness: 0.1,
                                  ),
                                if (isConfirmed)
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                if (isConfirmed)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        title: 'TOTAL AMOUNT:',
                                        textColor: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                      TextWidget(
                                        title: 'ISLAMI 1010',
                                        textColor: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ],
                                  ),
                                if (isConfirmed)
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                if (isConfirmed)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Spacer(),
                                      TextWidget(
                                        title: '\$26.17216',
                                        fontSize: 15.sp,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          RoundedContainer(
                            onTap: () {
                              context.router.pop();
                            },
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            radius: 50,
                            border: Border.all(
                              color: AppColors.teal,
                            ),
                            child: Center(
                              child: TextWidget(
                                title: 'Done',
                                textColor: AppColors.teal,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
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
