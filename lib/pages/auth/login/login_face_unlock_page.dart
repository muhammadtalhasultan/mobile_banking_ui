import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/constants.dart';

class LoginFaceUnlockPage extends StatefulWidget {
  const LoginFaceUnlockPage({super.key});

  @override
  State<LoginFaceUnlockPage> createState() => _LoginFaceUnlockPageState();
}

class _LoginFaceUnlockPageState extends State<LoginFaceUnlockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RPadding(
          padding: REdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Unlock with Face ID',
                style: largeTextStyle,
              ),
              SizedBox(
                height: 70.h,
              ),
              CircularPercentIndicator(
                radius: 70.r,
                lineWidth: 4.w,
                percent: 0.5,
                reverse: true,
                backgroundColor: const Color(0xFFFFF9EF),
                center: SvgPicture.asset('assets/svg/face_icon.svg'),
                progressColor: const Color(0xFFFCC97C),
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Move your head slowly to complete the\nregistration',
                style: xSmallTextStyle,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
