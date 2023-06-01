import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import '../../utils/routes.dart';
import '../../widgets/list_tile_card.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

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
          'Security',
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
          ListTileCard(
            iconPath: 'assets/svg/security_icon.svg',
            title: 'Password',
            onTap: () {
              Navigator.of(context).pushNamed(
                RouteGenerator.scanPage,
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          ListTileCard(
            iconPath: 'assets/svg/pin_icon.svg',
            title: 'PIN',
            onTap: () {},
          ),
          SizedBox(
            height: 16.h,
          ),
          ListTileCard(
            iconPath: 'assets/svg/finger_print_icon.svg',
            title: 'Fingerprint',
            onTap: () {},
          ),
          SizedBox(
            height: 16.h,
          ),
          ListTileCard(
            iconPath: 'assets/svg/face_id_icon.svg',
            title: 'Face ID',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
