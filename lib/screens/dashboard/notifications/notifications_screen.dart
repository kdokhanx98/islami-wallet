import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/notification_item.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/text_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title: 'Notifications',
              textColor: Colors.white,
              fontSize: 19.sp,
            ),
            SizedBox(
              height: 4.h,
            ),
            RoundedContainer(
                // onTap: () => context.router.push(const TransferFillRoute()),
                width: double.infinity,
                containerColor: AppColors.gray3,
                radius: 20,
                padding: EdgeInsets.all(4.w),
                child: const TextWidget(title: 'No messages found !')),
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     return NotificationItem(index: index);
            //   },
            //   itemCount: 10,
            // )
          ],
        ),
      ))),
    );
  }
}
