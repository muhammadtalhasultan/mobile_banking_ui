import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/utils/constants.dart';

import '../../components/c_elevated_button.dart';
import '../../models/onboarding_content_model.dart';
import '../../utils/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return RPadding(
                  padding:
                      REdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          contents[i].image,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Text(contents[i].title, style: heading2),
                      SizedBox(height: 14.h),
                      Text(contents[i].discription,
                          textAlign: TextAlign.center, style: descriptionStyle),
                      SizedBox(
                        height: 113.h,
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: 135.w,
                            child: CElevatedButton(
                              child: Text(currentIndex == contents.length - 1
                                  ? "Get Started"
                                  : "Continue"),
                              onPressed: () {
                                if (currentIndex == contents.length - 1) {
                                  Navigator.of(context).pushReplacementNamed(
                                    RouteGenerator.loginPage,
                                  );
                                }
                                _controller!.nextPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.bounceIn,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 32 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentIndex == index ? secondaryColor : neutralColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
