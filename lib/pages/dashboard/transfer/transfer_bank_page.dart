import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/components/c_text_form_field.dart';
import 'package:wallet_app/components/multiline_text_field.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/widgets/balance_card.dart';

class TransferBankPage extends StatefulWidget {
  const TransferBankPage({super.key});

  @override
  State<TransferBankPage> createState() => _TransferBankPageState();
}

class _TransferBankPageState extends State<TransferBankPage> {
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
        padding: REdgeInsets.all(24),
        shrinkWrap: true,
        children: [
          Text(
            'Bank',
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
            height: 12.h,
          ),
          Text(
            'Account Number',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          CTextFormField(
            hintText: '1234 **** *** 123',
          ),
          SizedBox(
            height: 16.h,
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
            height: 22.h,
          ),
          Text(
            'Personal Note',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          MultilineTextField(
            hintText: 'To buy food later tonight',
            minLines: 2,
          ),
          SizedBox(
            height: 24.h,
          ),
          CElevatedButton(child: const Text('Transfer'), onPressed: () {})
        ],
      ),
    );
  }
}
