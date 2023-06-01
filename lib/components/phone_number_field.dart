// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/utils/constants.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController? textControllor;
  final String? hintText;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool? showCursor;
  void Function()? onTap;
  final String? Function(String?)? validator;
  void Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;

  PhoneNumberField({
    super.key,
    this.textControllor,
    this.hintText,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.showCursor,
    this.onTap,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  final kInputFocusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: const BorderSide(color: primaryColor, width: 1));

  final kInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: const BorderSide(color: Color(0xFFE2E4EA), width: 1));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textControllor,
      decoration: InputDecoration(
        hintStyle: hintTextStyle,
        filled: true,
        fillColor: fillColor,
        focusColor: primaryColor,
        hintTextDirection: TextDirection.ltr,
        alignLabelWithHint: true,
        border: kInputBorder,
        enabledBorder: kInputBorder,
        focusedBorder: kInputFocusBorder,
        contentPadding: REdgeInsets.all(18),
        prefixIcon: Padding(
          padding: REdgeInsets.symmetric(vertical: 17.h, horizontal: 18.w),
          child: prefixIcon,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      style: inputTextStyle,
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: readOnly,
      showCursor: showCursor,
      onTap: onTap,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
