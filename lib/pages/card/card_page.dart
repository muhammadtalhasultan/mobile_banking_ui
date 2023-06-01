import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/widgets/balance_card.dart';
import 'package:wallet_app/widgets/select_card.dart';

import '../../utils/constants.dart';
import '../../utils/routes.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

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
          'Card',
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
            'Select Card',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 12.h,
          ),
          const SelectCard(),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Balance',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 12.h,
          ),
          const BalanceCard(),
          SizedBox(
            height: 24.h,
          ),
          DottedBorder(
              color: const Color(0xFF767D88),
              strokeCap: StrokeCap.butt,
              dashPattern: const [8, 6],
              borderType: BorderType.RRect,
              strokeWidth: 1,
              radius: Radius.circular(6.r),
              padding: REdgeInsets.all(16),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RouteGenerator.addCardPage,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Color(0xFF767D88),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Text(
                      'Add Card',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF767D88),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
