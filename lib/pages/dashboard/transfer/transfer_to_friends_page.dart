import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/widgets/balance_card.dart';
import 'package:wallet_app/widgets/enter_pin.dart';

import '../../../components/multiline_text_field.dart';
import '../../../utils/routes.dart';

class TransferToFriendsPage extends StatefulWidget {
  const TransferToFriendsPage({super.key});

  @override
  State<TransferToFriendsPage> createState() => _TransferToFriendsPageState();
}

class _TransferToFriendsPageState extends State<TransferToFriendsPage> {
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
            'Recipient',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 12.h,
          ),
          ListTile(
            contentPadding: REdgeInsets.all(0),
            leading: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Image.asset(
                  'assets/images/friends_image.png',
                  fit: BoxFit.fill,
                )),
            title: Text(
              'Faiza Mubarak',
              style: mediumTextStyle,
            ),
            subtitle: Text(
              '2320 **** **** 2093',
              style: xSmallTextStyle,
            ),
            trailing: InkWell(
              onTap: () => _enterPin(context),
              child: const Icon(
                Icons.more_horiz,
                color: Color(0xFF767D88),
              ),
            ),
          ),
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
            height: 24.h,
          ),
          Text(
            'Personal Note',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 12.h,
          ),
          MultilineTextField(
            hintText: 'To buy food later tonight',
            minLines: 4,
          ),
          SizedBox(
            height: 100.h,
          ),
          CElevatedButton(
              child: const Text('Transfer'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.transferSuccessfulPage,
                );
              })
        ],
      ),
    );
  }

  void _enterPin(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: ctx,
      // constraints: BoxConstraints.tight(Size(double.infinity, 542.h)),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(9),
        ),
      ),

      builder: (_) {
        return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Card(
                color: Colors.white,
                // elevation: 15,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                margin: REdgeInsets.only(bottom: 50.h, left: 16.w, right: 16.w),
                child: EnterPin()));
      },
    );
  }
}
