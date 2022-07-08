import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:notification_permissions/notification_permissions.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage>
    with WidgetsBindingObserver {
  bool status = false;
  // late Future<String> permissionStatusFuture;

  // var permGranted = "granted";
  // var permDenied = "denied";
  // var permUnknown = "unknown";
  // var permProvisional = "provisional";

  // @override
  // void initState() {
  //   super.initState();
  //   // set up the notification permissions class
  //   // set up the future to fetch the notification data
  //   permissionStatusFuture = getCheckNotificationPermStatus();
  //   // With this, we will be able to check if the permission is granted or not
  //   // when returning to the application
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // /// When the application has a resumed status, check for the permission
  // /// status
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     setState(() {
  //       permissionStatusFuture = getCheckNotificationPermStatus();
  //     });
  //   }
  // }

  // /// Checks the notification permission status
  // Future<String> getCheckNotificationPermStatus() {
  //   return NotificationPermissions.getNotificationPermissionStatus()
  //       .then((status) {
  //     switch (status) {
  //       case PermissionStatus.denied:
  //         return permDenied;
  //       case PermissionStatus.granted:
  //         return permGranted;
  //       case PermissionStatus.unknown:
  //         return permUnknown;
  //       case PermissionStatus.provisional:
  //         return permProvisional;
  //       default:
  //         return 'null';
  //     }
  //   });
  // }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomIconWidget(
                    svgName: 'ic_back',
                    // onTap: () => context.router.push(const QRScanningRoute()),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              TextWidget(
                title: 'Notifications',
                // title: 'Swap',
                textColor: Colors.white,
                fontSize: 19.sp,
              ),
              SizedBox(
                height: 4.h,
              ),
              RoundedContainer(
                  radius: 20,
                  width: double.infinity,
                  containerColor: AppColors.gray3,
                  padding: EdgeInsets.all(6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget(
                              title: 'Push Notifications',
                              textColor: Colors.white,
                            ),
                            FlutterSwitch(
                              width: 9.h,
                              height: 5.h,
                              activeColor: AppColors.teal,
                              valueFontSize: 25.0,
                              toggleSize: 45.0,
                              value: status,
                              borderRadius: 30.0,
                              padding: 8.0,
                              showOnOff: false,
                              disabled: true,
                              onToggle: (val) {
                                setState(() {
                                  status = val;
                                });
                              },
                            ),
                          ])
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
