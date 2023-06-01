import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/constants.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
      body: ListView.separated(
        separatorBuilder: (context, index) => listViewSeparator,
        itemCount: 20,
        shrinkWrap: true,
        padding: REdgeInsets.all(24),
        itemBuilder: (context, index) => Slidable(
          key: const ValueKey(0),

          // The end action pane is the one at the right or the bottom side.
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                spacing: 10,
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
                onPressed: (_) {},
                backgroundColor: const Color(0xFFCF3100),
                foregroundColor: Colors.white,
                icon: Icons.delete_outline_outlined,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'System',
                      style: xXSmallTextStyle,
                    ),
                    Text(
                      'June 2, 2022',
                      style: xXSmallTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'New features in update version 0.223',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF160D07),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'In the latest update this time we bring some interesting features, quickly check and try our latest features',
                  style: xSmallTextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
