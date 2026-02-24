import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:festivo/core/theme/app_colors.dart';
import 'package:festivo/components/AppText.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});
  static const String route = '/onboding';

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      "icon": Icons.celebration_rounded,
      "title": "Welcome to Festivo",
      "description":
          "Discover the best festivals and events around you with ease and excitement.",
    },
    {
      "icon": Icons.map_rounded,
      "title": "Plan Your Journey",
      "description":
          "Organize your schedule, buy tickets, and stay updated with live notifications.",
    },
    {
      "icon": Icons.people_alt_rounded,
      "title": "Connect with Friends",
      "description":
          "Share your favorite moments and enjoy the festivals together with your community.",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  context.go('/home');
                },
                child: AppText(
                  text: "Skip",
                  color: AppColors.textSecondary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 280.w,
                          height: 280.w,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.2,
                              ),
                              width: 8.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryColor.withValues(
                                  alpha: 0.1,
                                ),
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Icon(
                            _onboardingData[index]['icon'] as IconData,
                            size: 120.w,
                            color: AppColors.accentColor,
                          ),
                        ),
                        SizedBox(height: 60.h),
                        AppText(
                          text: _onboardingData[index]['title'] as String,
                          textAlign: TextAlign.center,
                          color: AppColors.textPrimary,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                        SizedBox(height: 16.h),
                        AppText(
                          text: _onboardingData[index]['description'] as String,
                          textAlign: TextAlign.center,
                          color: AppColors.textSecondary,
                          fontSize: 16.sp,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentIndex == _onboardingData.length - 1) {
                            context.go('/home');
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          elevation: 0,
                        ),
                        child: AppText(
                          text: _currentIndex == _onboardingData.length - 1
                              ? "Get Started"
                              : "Next",
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 8.w),
      height: 8.h,
      width: _currentIndex == index ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: _currentIndex == index
            ? AppColors.primaryColor
            : AppColors.primaryColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
