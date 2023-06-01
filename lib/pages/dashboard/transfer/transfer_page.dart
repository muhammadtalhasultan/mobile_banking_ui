import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/utils/constants.dart';

import '../../../utils/routes.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: REdgeInsets.all(24),
        children: [
          Text(
            'Transfer to Friend',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Container(
                height: 56.h,
                width: 56.w,
                padding: REdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: SvgPicture.asset('assets/svg/search_icon.svg'),
              ),
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
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                RouteGenerator.transferToFriendsPage,
                              );
                            },
                            child: Container(
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
                            ),
                          )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Bank transfer',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: const Color(0xFFF5F5F6),
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.transferBankPage,
                );
              },
              contentPadding: REdgeInsets.all(0),
              leading: SvgPicture.asset('assets/svg/bank_card_icon.svg'),
              title: Text(
                'Bank Rakjat Cibodas',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF160D07),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: primaryColor,
                size: 15.r,
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
                'Transfer to Faiza Mubarak',
                style: smallTextStyle,
              ),
              subtitle: Text(
                'June 7 , 2022 at 11:10 PM',
                style: xSmallTextStyle,
              ),
              trailing: Text(
                '-\$1,200',
                style: mediumTextStyle.copyWith(color: redColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
