import 'package:festivo/components/app_text.dart';
import 'package:festivo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Dummy Data ---
class _ServiceCategory {
  final String name;
  final IconData icon;
  final Color color;
  final String description;
  final String priceRange;
  final int vendors;

  const _ServiceCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
    required this.priceRange,
    required this.vendors,
  });
}

const List<_ServiceCategory> _categories = [
  _ServiceCategory(
    name: 'Tent House',
    icon: Icons.house_rounded,
    color: Color(0xFFE8D5CC),
    description: 'Premium tents, pandals & shamiana setups',
    priceRange: '₹15,000 – ₹2,00,000',
    vendors: 42,
  ),
  _ServiceCategory(
    name: 'Lighting & Decor',
    icon: Icons.lightbulb_rounded,
    color: Color(0xFFFFF3CD),
    description: 'LED lighting, stage decoration & flower setups',
    priceRange: '₹8,000 – ₹1,50,000',
    vendors: 38,
  ),
  _ServiceCategory(
    name: 'Mehandi',
    icon: Icons.front_hand_rounded,
    color: Color(0xFFD4EDDA),
    description: 'Traditional bridal & guest mehandi artists',
    priceRange: '₹3,000 – ₹25,000',
    vendors: 27,
  ),
  _ServiceCategory(
    name: 'Wedding Cards',
    icon: Icons.mail_rounded,
    color: Color(0xFFD6D5F0),
    description: 'Custom printed & digital wedding invitations',
    priceRange: '₹2,000 – ₹50,000',
    vendors: 19,
  ),
  _ServiceCategory(
    name: 'DJ & Music',
    icon: Icons.music_note_rounded,
    color: Color(0xFFCCE5FF),
    description: 'DJ systems, live bands & sound setup',
    priceRange: '₹12,000 – ₹1,00,000',
    vendors: 31,
  ),
  _ServiceCategory(
    name: 'Wedding Venues',
    icon: Icons.location_city_rounded,
    color: Color(0xFFF5D5D5),
    description: 'Gardens, banquet halls & farmhouses',
    priceRange: '₹50,000 – ₹10,00,000',
    vendors: 56,
  ),
  _ServiceCategory(
    name: 'Corporate Events',
    icon: Icons.business_center_rounded,
    color: Color(0xFFD5E8D4),
    description: 'Conferences, team outings & annual meets',
    priceRange: '₹25,000 – ₹5,00,000',
    vendors: 15,
  ),
  _ServiceCategory(
    name: 'Catering',
    icon: Icons.restaurant_rounded,
    color: Color(0xFFFFE0CC),
    description: 'Multi-cuisine food & beverage service',
    priceRange: '₹300 – ₹2,000/plate',
    vendors: 48,
  ),
  _ServiceCategory(
    name: 'Photography',
    icon: Icons.camera_alt_rounded,
    color: Color(0xFFE0D5F5),
    description: 'Photo, video, drone & candid coverage',
    priceRange: '₹10,000 – ₹3,00,000',
    vendors: 63,
  ),
];

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});
  static const String route = '/services';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'All Services',
                style: GoogleFonts.inriaSerif(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 6.h),
              AppText(
                text: 'Browse all event services we offer',
                fontSize: 14.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 24.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${cat.name} — ${cat.vendors} vendors available',
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10.r,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.w,
                            decoration: BoxDecoration(
                              color: cat.color,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Icon(
                              cat.icon,
                              size: 28.sp,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: cat.name,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                                SizedBox(height: 4.h),
                                AppText(
                                  text: cat.description,
                                  fontSize: 12.sp,
                                  color: AppColors.textSecondary,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    AppText(
                                      text: cat.priceRange,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.people_outline_rounded,
                                      size: 14.sp,
                                      color: AppColors.textSecondary,
                                    ),
                                    SizedBox(width: 4.w),
                                    AppText(
                                      text: '${cat.vendors} vendors',
                                      fontSize: 11.sp,
                                      color: AppColors.textSecondary,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16.sp,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }
}
