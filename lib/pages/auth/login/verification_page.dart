import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/constants.dart';
import '../../../utils/routes.dart';

class VerificationPage extends StatefulWidget {
  final String email;
  const VerificationPage({super.key, required this.email});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final _otpFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.transparent;
    // const fillColor = Color(0xFFD9D9D9);
    const borderColor = Colors.transparent;

    final defaultPinTheme = PinTheme(
      // padding: ,
      width: 44.w,
      height: 64.h,
      textStyle: heading2,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEEF0),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: scaffoldColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: arrowBackColor,
          ),
        ),
        leadingWidth: 50.w,
      ),
      body: Center(
        child: RPadding(
          padding: REdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Confirm your phone number', style: largeTextStyle),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Enter the confirmation code sent to the number :',
                style: xSmallTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text('+62 1223 **** 2133', style: mediumTextStyle),
              SizedBox(
                height: 52.h,
              ),
              Form(
                  key: _otpFormKey,
                  child: Column(
                    children: [
                      Pinput(
                        controller: pinController,
                        length: 6,
                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        // validator: (s) {
                        //   return s=='224411'
                        //       ? null
                        //       : 'Pin is incorrect';
                        // },
                        // onClipboardFound: (value) {
                        //   debugPrint('onClipboardFound: $value');
                        //   pinController.setText(value);
                        // },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        keyboardType: TextInputType.number,
                        onCompleted: (pin) {
                          // otp.otpVerified = true;
                          // Provider.of<VerifyEmailProvider>(context,
                          //         listen: false)
                          //     .verifyEmail(_otpFormKey, context,
                          //         widget.email, pin);
                          Navigator.of(context).pushReplacementNamed(
                            RouteGenerator.navigationPage,
                          );
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 1.w,
                              height: 30.h,
                              color: primaryColor,
                            ),
                          ],
                        ),
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            // color: secondaryColor,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/time_icon.svg',
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text.rich(
                            textAlign: TextAlign.left,
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Resend In ', style: xSmallTextStyle),
                                TextSpan(
                                    text: '00:44',
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF160D07),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
