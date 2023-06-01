import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:wallet_app/utils/constants.dart';

import '../../utils/routes.dart';
import '../../widgets/balance_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: scaffoldColor,
        title: RPadding(
          padding: REdgeInsets.only(left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello M.Adif👋',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF160D07),
                ),
              ),
              Text('Wellcome Back!', style: smallTextStyle),
            ],
          ),
        ),
        actions: [
          // IconButton(
          //   splashColor: whiteColor,
          //   onPressed: (){}, icon: SvgPicture.asset('assets/svg/notifications_icon.svg'),

          // ),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              RouteGenerator.notificationPage,
            ),
            child: Container(
              margin: REdgeInsets.all(5),
              padding: REdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: kDefaultBoxShadow,
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(3.r)),
              ),
              child: SvgPicture.asset('assets/svg/notifications_icon.svg'),
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: REdgeInsets.all(24),
        children: [
          const BalanceCard(),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _card('assets/svg/send_icon.svg', 'Transfer', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.transferPage,
                );
              }),
              _card('assets/svg/recieve_icon.svg', 'Recieve', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.loginFingerprintPage,
                );
              }),
              _card('assets/svg/withdraw_icon.svg', 'Withdraw', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.withdrawPage,
                );
              }),
              _card('assets/svg/bill_icon.svg', 'Payment', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.paymentPage,
                );
              })
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Send to Friends',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              DottedBorder(
                  color: const Color(0xFF767D88),
                  strokeCap: StrokeCap.butt,
                  borderType: BorderType.RRect,
                  strokeWidth: 1,
                  radius: Radius.circular(6.r),
                  padding: REdgeInsets.all(16),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF767D88),
                  )),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: SizedBox(
                  height: 56.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 7,
                      padding: REdgeInsets.all(0),
                      itemBuilder: (context, index) => Container(
                            width: 56.w,
                            height: 56.h,
                            margin: REdgeInsets.only(right: 12.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: Image.asset(
                                  'assets/images/friends_image.png',
                                  fit: BoxFit.fill,
                                )),
                          )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Savings',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: REdgeInsets.all(16.r),
            decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: kDefaultBoxShadow,
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Column(
              children: [
                ListTile(
                  contentPadding: REdgeInsets.all(0),
                  leading: Image.asset('assets/images/macbook_pro_image.png'),
                  title: Text(
                    'Macbook Pro M1 Max 1TB',
                    style: smallTextStyle,
                  ),
                  subtitle: Text(
                    '\$200/\$2,000',
                    style: xSmallTextStyle,
                  ),
                  trailing: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RouteGenerator.savingPage,
                        );
                      },
                      child: const Icon(Icons.more_horiz)),
                ),
                SizedBox(
                  height: 18.h,
                ),
                LinearPercentIndicator(
                  width: 295.w,
                  lineHeight: 14.0,
                  percent: 0.5,
                  backgroundColor: const Color(0xFFEDEEF0),
                  progressColor: yellowColor,
                  barRadius: Radius.circular(17.r),
                ),
              ],
            ),
          ),
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
                    RouteGenerator.addSavingPage,
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
                      'Add Saving',
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

  _card(String icon, String title, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            padding: REdgeInsets.symmetric(vertical: 22.h),
            decoration: BoxDecoration(
                color: const Color(0xFF3A3A3A),
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: SvgPicture.asset(
              icon,
              width: 20.w,
              height: 20.h,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF767D88),
            ),
          )
        ],
      ),
    );
  }
}
