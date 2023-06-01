// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wallet_app/widgets/balance_card.dart';

// import '../../utils/constants.dart';

// class WalletPage extends StatelessWidget {
//   const WalletPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//   backgroundColor: scaffoldColor,

//       body: RPadding(
//         padding: REdgeInsets.all(24.0),
//         child: Column(
//           children: [
//              SizedBox(
//               height: 24.h,
//             ),
//             Text('Wallet',
//         style: mediumTextStyle,
//         ),
//          SizedBox(
//               height: 24.h,
//             ),
//             BalanceCard(),
//             SizedBox(
//               height: 24.h,
//             ),

// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, non_constant_identifier_names

import 'package:badges/badges.dart' as badges;
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wallet_app/utils/constants.dart';

import '../../utils/routes.dart';
import '../../widgets/balance_card.dart';

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.h,
      child: Stack(
        children: [
          Positioned(
            child: BarChart(
              BarChartData(
                barTouchData: barTouchData,
                titlesData: titlesData,
                borderData: borderData,
                barGroups: barGroups,
                groupsSpace: 0.w,
                baselineY: 60,
                gridData: FlGridData(show: true),
                alignment: BarChartAlignment.spaceBetween,
                maxY: 20.h,
              ),
            ),
          ),
          Positioned(
            top: 73.h,
            bottom: 100.h,
            right: 110.w,
            left: 110.w,
            child: badges.Badge(
              // badgeContent: SvgPicture.asset('assets/svg/pencil_icon.svg'),
              showBadge: true,
              position: badges.BadgePosition.bottomEnd(),
              badgeStyle: badges.BadgeStyle(
                  badgeColor: primaryColor, padding: REdgeInsets.all(8)),
              // badgeContent: SvgPicture.asset('assets/svg/pencil_icon.svg'),
              child: Container(
                width: 90.w,
                height: 40.h,
                padding: REdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color: const Color(0xFFF69400),
                    borderRadius: BorderRadius.all(Radius.circular(3.r))),
                alignment: Alignment.center,
                child: Text(
                  '\$512.00',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Sun';
        break;
      case 1:
        text = 'Mon';
        break;
      case 2:
        text = 'Tue';
        break;
      case 3:
        text = 'Wed';
        break;
      case 4:
        text = 'Thu';
        break;
      case 5:
        text = 'Fri';
        break;
      case 6:
        text = 'Sat';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 70,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [secondaryColor, primaryColor],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                toY: 8,
                width: 32.w,
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r))
                //gradient: _barsGradient,
                )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                toY: 10,
                // gradient: _barsGradient,
                width: 32.w,
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                toY: 14,
                //gradient: _barsGradient,
                width: 32.w,
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                toY: 15,
                //gradient: _barsGradient,
                width: 32.w,
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                toY: 13,
                // gradient: _barsGradient,
                width: 32.w,
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
                toY: 10,
                //gradient: _barsGradient,
                width: 32.w,
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r)))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
                toY: 16,
                //gradient: _barsGradient,
                width: 32.w,
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r)))
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<StatefulWidget> createState() => WalletPageState();
}

class WalletPageState extends State<WalletPage> {
  int selectedTabBar = 0;
  bool visible = true;
  String _title = '';

  @override
  Widget build(BuildContext context) {
    final graphTabs = TabBar(
        indicatorColor: Colors.transparent,
        padding: REdgeInsets.all(0),
        onTap: (value) {
          setState(() {
            selectedTabBar = value;
          });
        },
        isScrollable: true,
        tabs: <Tab>[
          Tab(
              //height: 50.h,
              icon: Container(
            padding: REdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: selectedTabBar == 0 ? primaryColor : primarySurfaceColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Text(
              'Weekly',
              style: smallTextStyle.copyWith(
                  color: selectedTabBar == 0 ? whiteColor : primaryColor),
            ),
          )),
          Tab(
              //height: 80.h,
              icon: Container(
            padding: REdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: selectedTabBar == 1 ? primaryColor : primarySurfaceColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Text(
              'Monthly',
              style: smallTextStyle.copyWith(
                  color: selectedTabBar == 1 ? whiteColor : primaryColor),
            ),
          )),
          Tab(
              // height: 80.h,
              icon: Container(
            padding: REdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: selectedTabBar == 2 ? primaryColor : primarySurfaceColor,
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Text(
              'Yearly',
              style: smallTextStyle.copyWith(
                  color: selectedTabBar == 2 ? whiteColor : primaryColor),
            ),
          )),
        ]);

    _walletWidget() {
      return Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Wallet',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 24.h,
          ),
          const BalanceCard(),
          SizedBox(
            height: 24.h,
          ),
          graphTabs,
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: TabBarView(
              children: [
                _WeeklyWidget(),
                const Center(
                  child: Text('Monthly'),
                ),
                const Center(
                  child: Text('Yearly'),
                )
              ],
            ),
          )
        ],
      );
    }

    _incomeExpenseWidget(String title) {
      return Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RouteGenerator.navigationPage,
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: primaryColor,
                  size: 20.r,
                ),
              ),
              SizedBox(
                width: 80.w,
              ),
              Text(
                title,
                style: mediumTextStyle,
              ),
              const Expanded(child: SizedBox())
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          graphTabs,
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: TabBarView(
              children: [
                _weeklyIncomeExpenseWidget(title),
                const Center(
                  child: Text('Monthly'),
                ),
                const Center(
                  child: Text('Yearly'),
                )
              ],
            ),
          )
        ],
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: RPadding(
          padding: REdgeInsets.all(24.0),
          child: visible ? _walletWidget() : _incomeExpenseWidget(_title),
        ),
      ),
    );
  }

  _WeeklyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AspectRatio(
            aspectRatio: 1.6,
            child: _BarChart(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Detail',
              style: mediumTextStyle,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          InkWell(
            onTap: () {
              _title = 'Expense';
              setState(() {
                visible = false;
              });
            },
            child: Container(
                padding:
                    REdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expense',
                          style: xSmallTextStyle.copyWith(color: whiteColor),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '\$1,000.00',
                          style: largeTextStyle.copyWith(color: whiteColor),
                        ),
                      ],
                    ),
                    CircularPercentIndicator(
                      radius: 30.r,
                      lineWidth: 5.0,
                      percent: 0.5,
                      backgroundColor: whiteColor,
                      center: Text(
                        '65%',
                        style: xSmallTextStyle.copyWith(color: whiteColor),
                      ),
                      progressColor: secondaryFocusColor,
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 16.h,
          ),
          InkWell(
            onTap: () {
              _title = 'Income';
              setState(() {
                visible = false;
              });
            },
            child: Container(
                padding:
                    REdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                    color: const Color(0xFF7C7C7C),
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Income',
                          style: xSmallTextStyle.copyWith(color: whiteColor),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '\$1,000.00',
                          style: largeTextStyle.copyWith(color: whiteColor),
                        ),
                      ],
                    ),
                    CircularPercentIndicator(
                      radius: 30.r,
                      lineWidth: 5.0,
                      percent: 0.5,
                      backgroundColor: whiteColor,
                      center: Text(
                        '65%',
                        style: xSmallTextStyle.copyWith(color: whiteColor),
                      ),
                      progressColor: secondaryFocusColor,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  _weeklyIncomeExpenseWidget(String title) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AspectRatio(
            aspectRatio: 1.6,
            child: _BarChart(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: mediumTextStyle,
              ),
              const Icon(
                Icons.more_horiz,
                color: primaryColor,
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: 14,
            padding: REdgeInsets.all(0),
            itemBuilder: (context, index) => ListTile(
              title: Text(
                'You Saving',
                style: smallTextStyle,
              ),
              subtitle: Text(
                'June 7 , 2022 at 11:10 PM',
                style: xSmallTextStyle,
              ),
              trailing: Text(
                '+\$500',
                style: mediumTextStyle.copyWith(
                    color: title == 'Income' ? successColor : redColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
