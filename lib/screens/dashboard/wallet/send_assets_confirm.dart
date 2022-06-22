import 'package:flutter/material.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:sizer/sizer.dart';

class SendAssetsConfirmPage extends StatelessWidget {
  const SendAssetsConfirmPage({Key? key}) : super(key: key);

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
            children: const [
              CustomIconWidget(svgName: 'ic_back'),
            ],
          ),
        ),
      )),
    );
  }
}
