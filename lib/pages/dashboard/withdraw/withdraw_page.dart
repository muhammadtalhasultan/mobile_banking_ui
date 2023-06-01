import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/widgets/balance_card.dart';

import '../../../utils/routes.dart';
import '../../../widgets/select_card.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  int total = 1200;
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
          'Withdraw',
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
        padding: REdgeInsets.all(24),
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
          Text(
            'Amount',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: const Color(0xFFF5F5F6),
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: ListTile(
              contentPadding: REdgeInsets.all(0),
              title: Text(
                '\$$total|',
                style: heading2,
              ),
              trailing: SizedBox(
                width: 70.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        total > 0 ? total-- : total;
                        setState(() {});
                      },
                      child: Container(
                        padding: REdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r))),
                        child: const Icon(
                          Icons.remove,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          total++;
                        });
                      },
                      child: Container(
                        padding: REdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r))),
                        child: const Icon(
                          Icons.add,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 97.h,
          ),
          CElevatedButton(
              child: const Text('Continue'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.withdrawCodePage,
                );
              })
        ],
      ),
    );
  }
}
