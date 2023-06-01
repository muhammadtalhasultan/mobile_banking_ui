import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

const Color scaffoldColor = Color(0xFFFFFFFF);
const Color primaryColor = Color(0xFF3A3A3A);
const Color secondaryColor = Color(0xFFFCC97C);
const Color neutralColor = Color(0xFFEDEEF0);
const Color fillColor = Color(0xFFFFFFFF);
const Color secondaryButtonTextColor = Color(0xFF1D2125);
const Color arrowBackColor = Color(0xFF0C192C);
const Color navigationIconColor = Color(0xFFC2C5CA);
const Color yellowColor = Color(0xFFED8E00);
const Color secondaryFocusColor = Color(0xFFF69400);
const Color redColor = Color(0xFFF83B00);
const Color whiteColor = Color(0xFFFFFFFF);
const Color successColor = Color(0xFF00CF39);
const Color primarySurfaceColor = Color(0xFFF3F3F3);

final heading1 = GoogleFonts.plusJakartaSans(
  fontSize: 32.sp,
  fontWeight: FontWeight.w700,
  color: const Color(0xFF160D07),
);
final heading2 = GoogleFonts.plusJakartaSans(
  fontSize: 24.sp,
  fontWeight: FontWeight.w700,
  color: const Color(0xFF160D07),
);

final descriptionStyle = GoogleFonts.plusJakartaSans(
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
  color: const Color(0xFF767D88),
);

final largeTextStyle = GoogleFonts.plusJakartaSans(
  fontSize: 20.sp,
  fontWeight: FontWeight.w600,
  color: const Color(0xFF160D07),
);
final smallTextStyle = GoogleFonts.plusJakartaSans(
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  color: const Color(0xFF160D07),
);
final mediumTextStyle = GoogleFonts.plusJakartaSans(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
  color: const Color(0xFF160D07),
);
final xSmallTextStyle = GoogleFonts.plusJakartaSans(
  fontSize: 12.sp,
  fontWeight: FontWeight.w400,
  color: const Color(0xFF767D88),
);
final xXSmallTextStyle = GoogleFonts.plusJakartaSans(
  fontSize: 10.sp,
  fontWeight: FontWeight.w400,
  color: const Color(0xFF767D88),
);
final hintTextStyle = GoogleFonts.plusJakartaSans(
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  color: const Color(0xFF9FA4AB),
);

final inputTextStyle = GoogleFonts.plusJakartaSans(
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  color: const Color(0xFF160D07),
);

launchURLFunction(String url) async {
  //const url = 'https://google.com';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

List<BoxShadow> kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 16,
    offset: const Offset(0, -4),
  ),
];
List<BoxShadow> kYellowBoxShadow = [
  BoxShadow(
    color: Colors.amber.withOpacity(0.8),
    spreadRadius: 0,
    blurRadius: 16,
    offset: const Offset(0, -4),
  ),
];

final listViewSeparator = Divider(
  color: const Color(0xFFEDEEF0),
  height: 2.h,
);
