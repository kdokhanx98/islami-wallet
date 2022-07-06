import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_info.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/text_widget.dart';

class WalletDetailsPage extends StatelessWidget {
  const WalletDetailsPage(this.wallet, {Key? key}) : super(key: key);

  final WalletInfo wallet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomIconWidget(
                            svgName: 'ic_back',
                            // onTap: () => context.router.push(const QRScanningRoute()),
                          ),
                          // CustomIconWidget(
                          //   svgName: 'ic_add',
                          //   onTap: () {
                          //     context.router.push(const CreateNewWalletRoute());
                          //     // showModalBottomSheet<String>(
                          //     //     isScrollControlled: true,
                          //     //     useRootNavigator: true,
                          //     //     backgroundColor: Colors.transparent,
                          //     //     context: context,
                          //     //     builder: (BuildContext context) {
                          //     //       return FractionallySizedBox(
                          //     //           heightFactor: 0.90, child: addAssetsMethod());
                          //     //     });
                          //   },
                        ]),

                    SizedBox(height: 4.h),
                    TextWidget(
                      title: wallet.name,
                      // title: 'Swap',
                      textColor: Colors.white,
                      fontSize: 19.sp,
                    ),

                    //         Column(
                    //   children: [
                    //     TextWidget(
                    //       title: wallet.name,
                    //       textAlign: TextAlign.start,
                    //       maxLines: 1,
                    //       textColor: Colors.white,
                    //     ),
                    //     TextWidget(title: ' show name and secret phrase !')
                    //   ],
                    // )
                  ],
                ))));
  }
}
