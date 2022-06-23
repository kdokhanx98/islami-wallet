import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

enum TokensTime { sixMonths, oneYear, twoYears }

class LockTokensPage extends StatefulWidget {
  const LockTokensPage({Key? key}) : super(key: key);

  @override
  State<LockTokensPage> createState() => _NetworkFeePageState();
}

class _NetworkFeePageState extends State<LockTokensPage> {
  TokensTime? _character = TokensTime.sixMonths;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    const CustomIconWidget(svgName: 'ic_back'),
                    SizedBox(
                      width: 20.w,
                    ),
                    TextWidget(
                      title: 'Lock Tokens',
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  TextWidget(
                    title: 'Select time',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.all(4.w),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        disabledColor: AppColors.gray,
                        unselectedWidgetColor: AppColors.gray,
                      ),
                      child: RadioListTile<TokensTime>(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: AppColors.orange,
                        title: const TextWidget(
                          title: '6 Months',
                          textColor: Colors.white,
                          textAlign: TextAlign.start,
                        ),
                        value: TokensTime.sixMonths,
                        groupValue: _character,
                        onChanged: (TokensTime? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.all(4.w),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        disabledColor: AppColors.gray,
                        unselectedWidgetColor: AppColors.gray,
                      ),
                      child: RadioListTile<TokensTime>(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: AppColors.orange,
                        title: const TextWidget(
                          title: '1 Year',
                          textColor: Colors.white,
                          textAlign: TextAlign.start,
                        ),
                        value: TokensTime.oneYear,
                        groupValue: _character,
                        onChanged: (TokensTime? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.all(4.w),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        disabledColor: AppColors.gray,
                        unselectedWidgetColor: AppColors.gray,
                      ),
                      child: RadioListTile<TokensTime>(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: AppColors.orange,
                        title: const TextWidget(
                          title: '2 Years',
                          textColor: Colors.white,
                          textAlign: TextAlign.start,
                        ),
                        value: TokensTime.twoYears,
                        groupValue: _character,
                        onChanged: (TokensTime? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    width: double.infinity,
                    border: Border.all(color: AppColors.gray4),
                    containerColor: AppColors.primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.w),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      autocorrect: false,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Custom',
                          hintStyle: TextStyle(color: AppColors.gray)),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextWidget(
                    title: 'Amount',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    width: double.infinity,
                    border: Border.all(color: AppColors.gray4),
                    containerColor: AppColors.primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.w),
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      autocorrect: false,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Enter amount wish to lock',
                          hintStyle: TextStyle(color: AppColors.gray)),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  RoundedContainer(
                    onTap: () => context.router.pop(),
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    radius: 50,
                    border: Border.all(
                      color: AppColors.teal,
                    ),
                    child: Center(
                      child: TextWidget(
                        title: 'Send Tokens',
                        textColor: AppColors.teal,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
