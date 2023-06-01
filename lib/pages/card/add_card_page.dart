// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/components/c_elevated_button.dart';
import 'package:wallet_app/components/c_text_form_field.dart';

import '../../providers/date_provider.dart';
import '../../utils/constants.dart';
import '../../widgets/select_card.dart';

class AddCardPage extends StatelessWidget {
  AddCardPage({super.key});
  TextEditingController dateinput = TextEditingController();

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
          'Add Card',
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
          const SelectCard(),
          SizedBox(
            height: 24.h,
          ),
          CTextFormField(
            hintText: 'Card Number',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 16.h,
          ),
          CTextFormField(
            hintText: 'Card Holder Name',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                child: Consumer<DateProvider>(
                  builder: (context, dp, child) {
                    return CTextFormField(
                      textControllor: dateinput,
                      hintText: 'Expiration Date',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      onTap: () {
                        dp.pickDateDialog(context, dateinput);
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: CTextFormField(
                  hintText: 'CVV/CVC',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200.h,
          ),
          CElevatedButton(child: const Text('Add Card'), onPressed: () {}),
        ],
      ),
    );
  }
}
