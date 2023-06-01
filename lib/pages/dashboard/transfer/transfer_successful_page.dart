import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/components/secondary_button.dart';
import 'package:wallet_app/utils/constants.dart';

class TransferSuccessfulPage extends StatelessWidget {
  const TransferSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBDBDB),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFFDBDBDB),
        leadingWidth: 100.w,
        title: Text(
          'Transfer',
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
      body: Stack(
        children: [
          Positioned(
            top: 84.h,
            left: 24.w,
            right: 24.w,
            child: Container(
              height: 430.h,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(9.r))),
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Text(
                    'Transfer Successfull',
                    style: largeTextStyle,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      child: Image.asset(
                        'assets/images/friends_image.png',
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Faiza Mubarak',
                    style: mediumTextStyle,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    '2320 **** **** 2093',
                    style: xSmallTextStyle,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    '\$1,200.00',
                    style: heading1,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Tuesday, June 7 , 2022 at 11:10 PM',
                    style: xSmallTextStyle,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'View transaction details',
                    style: mediumTextStyle,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 402.h,
              left: 14.w,
              right: 14.w,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: const BoxDecoration(
                          color: Color(0xFFDBDBDB), shape: BoxShape.circle),
                    ),
                    const Expanded(
                      child: DottedLine(
                        dashColor: Color(0xFFE1E2E5),
                        dashLength: 6,
                      ),
                    ),
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: const BoxDecoration(
                          color: Color(0xFFDBDBDB), shape: BoxShape.circle),
                    )
                  ],
                ),
              )),
          Positioned(
              top: 34.h,
              left: 137.w,
              right: 137.w,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: secondaryColor,
                child: SvgPicture.asset('assets/svg/star_icon.svg'),
              )),
          Positioned(
            bottom: 40.h,
            left: 24.w,
            right: 24.w,
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: CElevatedButton(
                        child: const Text('Back To Home'), onPressed: () {})),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                    width: double.infinity,
                    child: SecondaryButton(
                        child: Text(
                          'Send Again',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: secondaryButtonTextColor,
                          ),
                        ),
                        onPressed: () {}))
              ],
            ),
          )
        ],
      ),
    );
  }
}
