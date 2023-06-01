import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:wallet_app/utils/constants.dart';

import '../../../widgets/numeric_keypad.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
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
    // const focusedBorderColor = Colors.transparent;
    // const fillColor = Color(0xFFD9D9D9);
    // const borderColor = Colors.transparent;

    final defaultPinTheme = PinTheme(
      padding: REdgeInsets.all(1),
      width: 25.w,
      height: 25.h,
      textStyle: mediumTextStyle,
      decoration: const BoxDecoration(
        color: Color(0xFFEDEEF0),
        shape: BoxShape.circle,
      ),
    );
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffoldColor,
        leadingWidth: 100.w,
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
      body: Center(
        child: RPadding(
          padding: REdgeInsets.all(52.0),
          child: SingleChildScrollView(
            child: Form(
              key: _otpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Text(
                    'Confirm new PIN',
                    style: largeTextStyle,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Pinput(
                    controller: pinController,
                    length: 6,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    readOnly: true,
                    mouseCursor: SystemMouseCursors.none,
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
                    keyboardType: TextInputType.none,

                    onCompleted: (pin) {
                      log(pin);
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

                    focusedPinTheme: defaultPinTheme,
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: secondaryColor,
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  NumericKeypad(
                    controller: pinController,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
