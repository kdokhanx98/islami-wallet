import 'package:flutter/material.dart';
import 'package:islami_wallet/widgets/custom_pages_back.dart';
import 'package:sizer/sizer.dart';

class RecoveryPhrasePage extends StatelessWidget {
  const RecoveryPhrasePage({Key? key}) : super(key: key);

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
              const CustomPagesBack(),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
