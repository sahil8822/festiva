import 'package:festivo/components/app_text.dart';
import 'package:festivo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Dummy Booking Data ---
class _Booking {
  final String eventName;
  final String vendorName;
  final String service;
  final String date;
  final String status; // confirmed, pending, completed
  final String amount;
  final IconData icon;

  const _Booking({
    required this.eventName,
    required this.vendorName,
    required this.service,
    required this.date,
    required this.status,
    required this.amount,
    required this.icon,
  });
}

const List<_Booking> _bookings = [
  _Booking(
    eventName: 'Sharma Wedding',
    vendorName: 'Royal Tent House',
    service: 'Tent House',
    date: 'Mar 15, 2026',
    status: 'confirmed',
    amount: '₹45,000',
    icon: Icons.house_rounded,
  ),
  _Booking(
    eventName: 'Sharma Wedding',
    vendorName: 'Pixel Studio',
    service: 'Photography',
    date: 'Mar 15, 2026',
    status: 'confirmed',
    amount: '₹28,000',
    icon: Icons.camera_alt_rounded,
  ),
  _Booking(
    eventName: 'Sharma Wedding',
    vendorName: 'DJ Ravi',
    service: 'DJ & Music',
    date: 'Mar 15, 2026',
    status: 'pending',
    amount: '₹15,000',
    icon: Icons.music_note_rounded,
  ),
  _Booking(
    eventName: 'Tech Corp Meet',
    vendorName: 'Sharma Caterers',
    service: 'Catering',
    date: 'Apr 02, 2026',
    status: 'pending',
    amount: '₹1,20,000',
    icon: Icons.restaurant_rounded,
  ),
  _Booking(
    eventName: 'Birthday Party',
    vendorName: 'Light Works',
    service: 'Lighting',
    date: 'Feb 10, 2026',
    status: 'completed',
    amount: '₹12,000',
    icon: Icons.lightbulb_rounded,
  ),
];

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});
  static const String route = '/bookings';

  Color _statusColor(String status) {
    switch (status) {
      case 'confirmed':
        return const Color(0xFF4CAF50);
      case 'pending':
        return const Color(0xFFFF9800);
      case 'completed':
        return AppColors.textSecondary;
      default:
        return AppColors.textSecondary;
    }
  }

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
                'My Bookings',
                style: GoogleFonts.inriaSerif(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 6.h),
              AppText(
                text: 'Track all your event bookings',
                fontSize: 14.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 20.h),

              // Stats Row
              Row(
                children: [
                  _buildStatCard('Confirmed', '2', const Color(0xFF4CAF50)),
                  SizedBox(width: 12.w),
                  _buildStatCard('Pending', '2', const Color(0xFFFF9800)),
                  SizedBox(width: 12.w),
                  _buildStatCard('Completed', '1', AppColors.textSecondary),
                ],
              ),
              SizedBox(height: 24.h),

              // Bookings List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _bookings.length,
                itemBuilder: (context, index) {
                  final booking = _bookings[index];
                  return Container(
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
                          width: 52.w,
                          height: 52.w,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Icon(
                            booking.icon,
                            color: AppColors.primaryColor,
                            size: 24.sp,
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: booking.vendorName,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                              SizedBox(height: 2.h),
                              AppText(
                                text:
                                    '${booking.service} • ${booking.eventName}',
                                fontSize: 12.sp,
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 12.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                  SizedBox(width: 4.w),
                                  AppText(
                                    text: booking.date,
                                    fontSize: 11.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText(
                              text: booking.amount,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: _statusColor(
                                  booking.status,
                                ).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: AppText(
                                text:
                                    booking.status[0].toUpperCase() +
                                    booking.status.substring(1),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: _statusColor(booking.status),
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Widget _buildStatCard(String label, String count, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            AppText(
              text: count,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            SizedBox(height: 4.h),
            AppText(
              text: label,
              fontSize: 11.sp,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
