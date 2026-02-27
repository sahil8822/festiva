import 'package:festivo/components/app_text.dart';
import 'package:festivo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String route = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),

              // Profile Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.primaryColor.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 15.r,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.2),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Icon(
                        Icons.person_rounded,
                        size: 40.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Sahil Kumar',
                      style: GoogleFonts.poppins(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'sahil@email.com',
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildProfileStat('Events', '3'),
                        Container(
                          width: 1,
                          height: 40.h,
                          color: Colors.white24,
                        ),
                        _buildProfileStat('Bookings', '5'),
                        Container(
                          width: 1,
                          height: 40.h,
                          color: Colors.white24,
                        ),
                        _buildProfileStat('Reviews', '8'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),

              // Menu Items
              _buildMenuItem(
                Icons.event_note_rounded,
                'My Events',
                'Manage all your events',
              ),
              _buildMenuItem(
                Icons.receipt_long_rounded,
                'Payment History',
                'View past transactions',
              ),
              _buildMenuItem(
                Icons.favorite_outline_rounded,
                'Saved Vendors',
                'Your wishlist',
              ),
              _buildMenuItem(
                Icons.star_outline_rounded,
                'My Reviews',
                "Reviews you've left",
              ),
              _buildMenuItem(
                Icons.settings_outlined,
                'Settings',
                'App preferences',
              ),
              _buildMenuItem(
                Icons.help_outline_rounded,
                'Help & Support',
                'FAQs and assistance',
              ),
              SizedBox(height: 16.h),

              // Logout
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.red,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      AppText(
                        text: 'Log Out',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: AppColors.primaryColor, size: 22.sp),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                SizedBox(height: 2.h),
                AppText(
                  text: subtitle,
                  fontSize: 12.sp,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14.sp,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
