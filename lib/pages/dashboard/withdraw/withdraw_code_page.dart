// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/utils/constants.dart';

class WithdrawCodePage extends StatefulWidget {
  const WithdrawCodePage({super.key});

  @override
  State<WithdrawCodePage> createState() => _WithdrawCodePageState();
}

class _WithdrawCodePageState extends State<WithdrawCodePage> {
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
    const fillColor = Color(0xFFD9D9D9);
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
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffoldColor,
        leadingWidth: 100.w,
        title: Text(
          'Withdraw',
          style: mediumTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 20.r,
          ),
        ),
      ),
      body: ListView(
        padding: REdgeInsets.all(24),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Text(
            'Withdrawal Code',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 12.h,
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
                      // Navigator.of(context).pushReplacementNamed(
                      //     RouteGenerator.navigationPage,
                      //   );
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
                                text: 'Valid Until ', style: xSmallTextStyle),
                            TextSpan(
                                text: '11:10 PM',
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
              )),
          SizedBox(
            height: 28.h,
          ),
          Text(
            'Procedures',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 18.h,
          ),
          ListTile(
            contentPadding: REdgeInsets.all(0),
            leading: Icon(
              Icons.circle,
              color: const Color(0xFF767D88),
              size: 10.r,
            ),
            title: Text(
              'Find the nearest ATM and select "Cardless transactions"',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF767D88),
              ),
            ),
          ),
          ListTile(
            contentPadding: REdgeInsets.all(0),
            leading: Icon(
              Icons.circle,
              color: const Color(0xFF767D88),
              size: 10.r,
            ),
            title: Text(
              'Enter your card number, the 6 codes above',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF767D88),
              ),
            ),
          ),
          ListTile(
            contentPadding: REdgeInsets.all(0),
            leading: Icon(
              Icons.circle,
              color: const Color(0xFF767D88),
              size: 10.r,
            ),
            title: Text(
              'Take money at ATM and done',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF767D88),
              ),
            ),
          ),
          SizedBox(
            height: 300.h,
          ),
          CElevatedButton(child: const Text('Continue'), onPressed: () {})
        ],
      ),
    );
  }
}
