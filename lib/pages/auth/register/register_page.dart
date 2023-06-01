import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/providers/confirm_password_provider.dart';

import '../../../components/c_text_form_field.dart';
import '../../../components/phone_number_field.dart';
import '../../../providers/password_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/routes.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        actions: [
          RPadding(
            padding: REdgeInsets.all(10.0),
            child: Text(
              'Step 1 of 4',
              style: smallTextStyle,
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
        leadingWidth: 50.w,
      ),
      body: SingleChildScrollView(
        child: RPadding(
          padding: REdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 136.h,
              ),
              Text('Creating New Account', style: largeTextStyle),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Fill in your data correctly and completely, so you can proceed to the next step',
                style: xSmallTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60.h,
              ),
              CTextFormField(
                hintText: 'E-mail/Phone Number',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20.h,
              ),
              PhoneNumberField(
                hintText: 'Phone Number',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                prefixIcon: Text(
                  '+62',
                  style: hintTextStyle,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Consumer<PasswordProvider>(
                builder: (context, pp, child) {
                  return CTextFormField(
                    textControllor: _passwordController,
                    //..text = 'test421',
                    obscureText: pp.isObscure,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    hintText: 'Password',

                    suffixIcon: IconButton(
                      onPressed: () {
                        pp.toggleIsObscure();
                      },
                      icon: Icon(
                        pp.isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: primaryColor,
                      ),
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter password';
                    //   } else if (value.length < 7) {
                    //     return 'Please enter at least 8 characters password';
                    //   }
                    //   return null;
                    // },
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Consumer<ConfirmPasswordProvider>(
                builder: (context, cp, child) {
                  return CTextFormField(
                    textControllor: _confirmPasswordController,
                    //..text = 'test421',
                    obscureText: cp.isObscure,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    hintText: 'Confirm Password',

                    suffixIcon: IconButton(
                      onPressed: () {
                        cp.toggleIsObscure();
                      },
                      icon: Icon(
                        cp.isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: primaryColor,
                      ),
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter password';
                    //   } else if (value.length < 7) {
                    //     return 'Please enter at least 8 characters password';
                    //   }
                    //   return null;
                    // },
                  );
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              'By continuing I agree, that Bambank will use my data as stated in the ',
                          style: xSmallTextStyle),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF160D07),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            String url = 'https://google.com';
                            launchURLFunction(url);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 98.h,
              ),
              SizedBox(
                  width: double.infinity,
                  child: CElevatedButton(
                      child: const Text('Continue'),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RouteGenerator.captureIdentityCardPage,
                        );
                      })),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
