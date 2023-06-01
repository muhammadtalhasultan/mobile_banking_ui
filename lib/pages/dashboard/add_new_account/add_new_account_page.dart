import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/components/c_text_form_field.dart';

import '../../../providers/password_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/routes.dart';

class AddNewAccountPage extends StatefulWidget {
  const AddNewAccountPage({super.key});

  @override
  State<AddNewAccountPage> createState() => _AddNewAccountPageState();
}

class _AddNewAccountPageState extends State<AddNewAccountPage> {
  final TextEditingController _bankController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffoldColor,
        leadingWidth: 100.w,
        title: Text(
          'Add New Account',
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
      body: RPadding(
        padding: REdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add new Account',
              style: mediumTextStyle,
            ),
            SizedBox(
              height: 16.h,
            ),
            Consumer<PasswordProvider>(
              builder: (context, pp, child) {
                return CTextFormField(
                  textControllor: _bankController,
                  obscureText: pp.isObscure,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  hintText: 'Bank',
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
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CTextFormField(
              hintText: 'Account Number',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text.rich(
              textAlign: TextAlign.left,
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Verification will go to your ',
                      style: xSmallTextStyle),
                  TextSpan(
                      text: 'E-mail ',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF160D07),
                      )),
                  TextSpan(text: 'or ', style: xSmallTextStyle),
                  TextSpan(
                      text: 'Phone number ',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF160D07),
                      )),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
                width: double.infinity,
                child: CElevatedButton(
                    child: const Text('Add Account'),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        RouteGenerator.loginFingerprintPage,
                      );
                    })),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
