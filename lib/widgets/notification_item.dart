import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../theme/colors.dart';

class NotificationItem extends StatelessWidget {
  final int index;
  const NotificationItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isUnread = index == 1 || index == 0;
    bool isLast = index == 9;
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 4.h : 1.5.h),
      child: RoundedContainer(
        radius: 30,
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        containerColor: AppColors.gray3,
        child: ListTile(
          leading: SvgPicture.asset(
              'assets/svg/${isUnread ? 'ic_notification_unread' : 'ic_notification_read'}.svg'),
          title: const TextWidget(
            title: 'Notification Title',
            textColor: Colors.white,
            textAlign: TextAlign.start,
          ),
          subtitle: const TextWidget(
            title:
                'Far far away, behind the word mountains, far from the countries Voka…',
            maxLines: 2,
            textAlign: TextAlign.start,
            overFlow: TextOverflow.ellipsis,
          ),
          trailing: TextWidget(
            title: '12 min ago',
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
