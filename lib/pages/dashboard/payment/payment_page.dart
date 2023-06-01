import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/components/c_elevated_button.dart';

import '../../../models/services_list.dart';
import '../../../utils/constants.dart';
import '../../../utils/routes.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

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
          'Payment',
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
              'Service',
              style: mediumTextStyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            GridView.builder(
                shrinkWrap: true,
                padding: REdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 90.w,
                    //mainAxisExtent: 100.h,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 24.w,
                    mainAxisSpacing: 16.h),
                itemCount: servicesList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return _card(servicesList[index].icon,
                      servicesList[index].title, servicesList[index].onTap);
                }),
            const Expanded(flex: 1, child: SizedBox()),
            SizedBox(
                width: double.infinity,
                child: CElevatedButton(
                    child: const Text('Back To Home'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        RouteGenerator.addNewAccountPage,
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
