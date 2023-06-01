import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 8.w,
              right: 8.w,
              child: Container(
                width: 311.w,
                height: 204.h,
                decoration: BoxDecoration(
                    color: const Color(0xFF414141),
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
              )),
          Positioned(
              bottom: 4.h,
              left: 4.w,
              right: 4.w,
              child: Container(
                width: 319.w,
                height: 204.h,
                decoration: BoxDecoration(
                    color: const Color(0xFFFCC97C),
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
              )),
          Positioned(
              bottom: 8.h,
              left: 0.w,
              right: 0.w,
              top: 0.w,
              child: Container(
                width: double.infinity,
                height: 204.h,
                decoration: BoxDecoration(
                    color: const Color(0xFF414141),
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: Stack(
                  children: [
                    Positioned(
                        top: 13.h,
                        left: 0,
                        child:
                            Image.asset('assets/images/card_background.png')),
                    Positioned(
                        child: RPadding(
                      padding: REdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'M Hanivan Adif',
                                style:
                                    mediumTextStyle.copyWith(color: whiteColor),
                              ),
                              SvgPicture.asset('assets/svg/wifi_icon.svg')
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          SvgPicture.asset('assets/svg/chip_icon.svg'),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            '234 **** **** 1234',
                            style: largeTextStyle.copyWith(color: whiteColor),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'VALID\nTHRU',
                                    style: GoogleFonts.poppins(
                                      fontSize: 6.sp,
                                      fontWeight: FontWeight.w400,
                                      color: whiteColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    '12/22',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: whiteColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Text(
                                    'CVV\nCVC',
                                    style: GoogleFonts.poppins(
                                      fontSize: 6.sp,
                                      fontWeight: FontWeight.w400,
                                      color: whiteColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    '212',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: whiteColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              SvgPicture.asset('assets/svg/stars_icon.svg')
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
