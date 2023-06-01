import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../utils/constants.dart';

class SavingPage extends StatelessWidget {
  const SavingPage({super.key});

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
          'Saving',
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
      body: Center(
        child: RPadding(
          padding: REdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Macbook Pro M1 Max 1TB',
                  style: largeTextStyle,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: 240.w,
                  height: 240.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.r))),
                  child: Stack(
                    children: [
                      Positioned(
                          child: Center(
                              child: Image.asset(
                                  'assets/images/saving_product_image.png'))),
                      Positioned(
                          top: 93.h,
                          left: 87.w,
                          right: 87.w,
                          child: Container(
                            padding: REdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.r))),
                            child: Text(
                              '10%',
                              style: largeTextStyle.copyWith(color: whiteColor),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                RPadding(
                  padding: REdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      LinearPercentIndicator(
                        lineHeight: 14.0,
                        percent: 0.5,
                        backgroundColor: const Color(0xFFEDEEF0),
                        progressColor: yellowColor,
                        barRadius: Radius.circular(17.r),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$0',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              )),
                          Text('\$2,000',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding:
                      REdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(6.r))),
                  child: ListTile(
                    contentPadding: REdgeInsets.all(0),
                    leading: SvgPicture.asset('assets/svg/chat_icon.svg'),
                    title: Text(
                      'Keep saving friends, remember what your initial goal was to save',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: mediumTextStyle,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: primaryColor,
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 14,
                  padding: REdgeInsets.all(0),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      'You Saving',
                      style: smallTextStyle,
                    ),
                    subtitle: Text(
                      'June 7 , 2022 at 11:10 PM',
                      style: xSmallTextStyle,
                    ),
                    trailing: Text(
                      '+10',
                      style: mediumTextStyle.copyWith(color: successColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
