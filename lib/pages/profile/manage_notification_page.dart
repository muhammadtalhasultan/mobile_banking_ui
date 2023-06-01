import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';
import '../../widgets/list_tile_card.dart';

class ManageNotificationPage extends StatefulWidget {
  const ManageNotificationPage({super.key});

  @override
  State<ManageNotificationPage> createState() => _ManageNotificationPageState();
}

class _ManageNotificationPageState extends State<ManageNotificationPage> {
  bool valueTrue = false;
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
          'Notification',
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
          Container(
            padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: primarySurfaceColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: ListTile(
              onTap: () {},
              contentPadding: REdgeInsets.all(0),
              leading: SvgPicture.asset('assets/svg/manage_notif_icon.svg'),
              title: Text(
                'Push Notification',
                style: smallTextStyle,
              ),
              trailing: CupertinoSwitch(
                value: valueTrue,
                onChanged: (value) {
                  valueTrue = value;
                  setState(() {});
                },
                trackColor: primaryColor,
                activeColor: const Color(0xFF81C115),
                thumbColor: valueTrue ? Colors.white : secondaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          ListTileCard(
            iconPath: 'assets/svg/manage_notif_icon.svg',
            title: 'Personalize Notification',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
