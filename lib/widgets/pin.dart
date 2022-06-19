import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:sizer/sizer.dart';

class PinWidget extends StatelessWidget {
  final String text;
  const PinWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index) {
          var isEnabled = index + 1 <= text.length;
          return RoundedContainer(
            containerColor: isEnabled ? AppColors.teal : Colors.transparent,
            padding: EdgeInsets.all(1.5.w),
            border: Border.all(color: AppColors.gray4),
          );
        }));
  }
}
