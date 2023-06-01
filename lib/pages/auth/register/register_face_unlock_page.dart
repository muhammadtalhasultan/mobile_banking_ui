import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/utils/constants.dart';

import '../../../utils/routes.dart';

class RegisterFaceUnlockPage extends StatefulWidget {
  const RegisterFaceUnlockPage({super.key});

  @override
  State<RegisterFaceUnlockPage> createState() => _RegisterFaceUnlockPageState();
}

class _RegisterFaceUnlockPageState extends State<RegisterFaceUnlockPage> {
  bool success = false;
  bool failed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20.r,
                  color: primaryColor,
                ),
              ),
              Text(
                'Step 4 of 4',
                style: smallTextStyle,
              )
            ],
          ),
          SizedBox(
            height: 136.h,
          ),
          Column(
            children: [
              Text(
                'Biometric Security',
                style: largeTextStyle,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'For more advanced security, register your fingerprint and\nface unlock',
                style: xSmallTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 47.h,
              ),
              success
                  ? SvgPicture.asset('assets/svg/face_unlock_success.svg')
                  : failed
                      ? SvgPicture.asset('assets/svg/face_unlock_failed.svg')
                      : CircularPercentIndicator(
                          radius: 90.r,
                          lineWidth: 4.w,
                          percent: 0.5,
                          reverse: true,
                          backgroundColor: const Color(0xFFFFF9EF),
                          center: SvgPicture.asset('assets/svg/face_icon.svg'),
                          progressColor: const Color(0xFFFCC97C),
                        ),
              SizedBox(
                height: 40.h,
              ),
              success
                  ? Text(
                      'Registration is successful, you can proceed\nto the next step',
                      style: xSmallTextStyle,
                      textAlign: TextAlign.center,
                    )
                  : failed
                      ? Text(
                          'Registration failed, try again or try in a lighter\nplace',
                          style: xSmallTextStyle,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          'Move your head slowly to complete the\nregistration',
                          style: xSmallTextStyle,
                          textAlign: TextAlign.center,
                        ),
              SizedBox(
                height: 143.h,
              ),
              SizedBox(
                width: double.infinity,
                child: CElevatedButton(
                    child:
                        failed ? const Text('Retry') : const Text('Continue'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        RouteGenerator.registerSuccessPage,
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
