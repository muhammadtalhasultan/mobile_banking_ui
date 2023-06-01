import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            left: 5.w,
            right: 5.w,
            child: Container(
              width: 319.w,
              height: 88.h,
              decoration: BoxDecoration(
                  // boxShadow: kDefaultBoxShadow,
                  color: yellowColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
            ),
          ),
          Positioned(
            child: Container(
              width: 3327.w,
              height: 88.h,
              decoration: BoxDecoration(
                  // boxShadow: kDefaultBoxShadow,
                  color: yellowColor,
                  borderRadius: BorderRadius.all(Radius.circular(6.r))),
            ),
          ),
          Positioned(
            child: SvgPicture.asset('assets/svg/dashboard_card.svg'),
          ),
          Positioned(
              child: RPadding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Balance',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF160D07),
                      ),
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: primaryColor,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$46,120.38',
                      style: heading2,
                    ),
                    Text(
                      '1233 **** **** 1234',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF160D07),
                      ),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
