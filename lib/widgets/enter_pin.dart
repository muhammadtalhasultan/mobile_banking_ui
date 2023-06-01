// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/utils/constants.dart';

import 'numeric_keypad.dart';

class EnterPin extends StatelessWidget {
  EnterPin({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.symmetric(horizontal: 35.w, vertical: 32.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Enter PIN',
              style: heading2,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                circle,
                SizedBox(
                  width: 20.w,
                ),
                circle,
                SizedBox(
                  width: 20.w,
                ),
                circle,
                SizedBox(
                  width: 20.w,
                ),
                circle,
                SizedBox(
                  width: 20.w,
                ),
                circle,
                SizedBox(
                  width: 20.w,
                ),
                circle
              ],
            ),
            SizedBox(
              height: 66.h,
            ),
            NumericKeypad(
              controller: _controller,
            )
          ],
        ),
      ),
    );
  }

  Widget circle = const Icon(
    Icons.circle,
    color: neutralColor,
  );
}
