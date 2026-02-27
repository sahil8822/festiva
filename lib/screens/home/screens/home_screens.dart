import 'package:festivo/components/app_text.dart';
import 'package:festivo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Dummy Data Models ---
class EventService {
  final String name;
  final IconData icon;
  final Color color;
  final String description;
  final double startingPrice;

  const EventService({
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
    required this.startingPrice,
  });
}

class FeaturedVendor {
  final String name;
  final String category;
  final double rating;
  final int reviews;
  final String price;
  final IconData icon;

  const FeaturedVendor({
    required this.name,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.icon,
  });
}

class UpcomingEvent {
  final String title;
  final String date;
  final String location;
  final double progress;
  final int tasksCompleted;
  final int totalTasks;
  final Color accentColor;

  const UpcomingEvent({
    required this.title,
    required this.date,
    required this.location,
    required this.progress,
    required this.tasksCompleted,
    required this.totalTasks,
    required this.accentColor,
  });
}

// --- Dummy Data ---
const List<EventService> _services = [
  EventService(
    name: 'Tent House',
    icon: Icons.house_rounded,
    color: Color(0xFFE8D5CC),
    description: 'Premium tents & pandals',
    startingPrice: 15000,
  ),
  EventService(
    name: 'Lighting',
    icon: Icons.lightbulb_rounded,
    color: Color(0xFFFFF3CD),
    description: 'LED & decoration lights',
    startingPrice: 8000,
  ),
  EventService(
    name: 'Mehandi',
    icon: Icons.front_hand_rounded,
    color: Color(0xFFD4EDDA),
    description: 'Traditional & modern henna',
    startingPrice: 3000,
  ),
  EventService(
    name: 'Wedding Card',
    icon: Icons.mail_rounded,
    color: Color(0xFFD6D5F0),
    description: 'Custom invitations',
    startingPrice: 2000,
  ),
  EventService(
    name: 'DJ & Music',
    icon: Icons.music_note_rounded,
    color: Color(0xFFCCE5FF),
    description: 'DJ, band & sound system',
    startingPrice: 12000,
  ),
  EventService(
    name: 'Venue',
    icon: Icons.location_city_rounded,
    color: Color(0xFFF5D5D5),
    description: 'Gardens & banquet halls',
    startingPrice: 50000,
  ),
  EventService(
    name: 'Corporate',
    icon: Icons.business_center_rounded,
    color: Color(0xFFD5E8D4),
    description: 'Corporate event planning',
    startingPrice: 25000,
  ),
  EventService(
    name: 'Catering',
    icon: Icons.restaurant_rounded,
    color: Color(0xFFFFE0CC),
    description: 'Multi-cuisine food service',
    startingPrice: 20000,
  ),
  EventService(
    name: 'Photography',
    icon: Icons.camera_alt_rounded,
    color: Color(0xFFE0D5F5),
    description: 'Photo & video coverage',
    startingPrice: 10000,
  ),
];

const List<FeaturedVendor> _featuredVendors = [
  FeaturedVendor(
    name: 'Royal Tent House',
    category: 'Tent House',
    rating: 4.8,
    reviews: 124,
    price: '₹15,000+',
    icon: Icons.house_rounded,
  ),
  FeaturedVendor(
    name: 'Sharma Caterers',
    category: 'Catering',
    rating: 4.9,
    reviews: 89,
    price: '₹500/plate',
    icon: Icons.restaurant_rounded,
  ),
  FeaturedVendor(
    name: 'Pixel Studio',
    category: 'Photography',
    rating: 4.7,
    reviews: 201,
    price: '₹18,000+',
    icon: Icons.camera_alt_rounded,
  ),
  FeaturedVendor(
    name: 'DJ Ravi',
    category: 'DJ & Music',
    rating: 4.6,
    reviews: 67,
    price: '₹12,000+',
    icon: Icons.music_note_rounded,
  ),
];

const List<UpcomingEvent> _upcomingEvents = [
  UpcomingEvent(
    title: 'Sharma Wedding',
    date: 'Mar 15, 2026',
    location: 'Royal Garden, Jaipur',
    progress: 0.65,
    tasksCompleted: 13,
    totalTasks: 20,
    accentColor: Color(0xFFC97C7C),
  ),
  UpcomingEvent(
    title: 'Tech Corp Annual Meet',
    date: 'Apr 02, 2026',
    location: 'Grand Hotel, Mumbai',
    progress: 0.30,
    tasksCompleted: 6,
    totalTasks: 20,
    accentColor: Color(0xFFD4B483),
  ),
];

// --- Home Screen ---
class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});
  static const String route = '/home';

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              SizedBox(height: 20.h),

              // --- Header ---
              _buildHeader(),
              SizedBox(height: 24.h),

              // --- Search Bar ---
              _buildSearchBar(),
              SizedBox(height: 28.h),

              // --- Upcoming Events ---
              if (_upcomingEvents.isNotEmpty) ...[
                _buildSectionTitle('Your Events', 'See All'),
                SizedBox(height: 16.h),
                _buildUpcomingEvents(),
                SizedBox(height: 28.h),
              ],

              // --- Quick Actions ---
              _buildQuickActions(),
              SizedBox(height: 28.h),

              // --- Our Services ---
              _buildSectionTitle('Our Services', 'View All'),
              SizedBox(height: 16.h),
              _buildServicesGrid(),
              SizedBox(height: 28.h),

              // --- Featured Vendors ---
              _buildSectionTitle('Top Vendors', 'See All'),
              SizedBox(height: 16.h),
              _buildFeaturedVendors(),

              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }

  // --- Header ---
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: '👋 Hello, Sahil',
              fontSize: 14.sp,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: 4.h),
            Text(
              'Plan Your Event',
              style: GoogleFonts.inriaSerif(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.notifications_none_rounded,
            color: AppColors.primaryColor,
            size: 24.sp,
          ),
        ),
      ],
    );
  }

  // --- Search Bar ---
  Widget _buildSearchBar() {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search services, vendors...',
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey.shade400,
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: AppColors.primaryColor,
            size: 22.sp,
          ),
          suffixIcon: Icon(
            Icons.tune_rounded,
            color: AppColors.textSecondary,
            size: 20.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ),
    );
  }

  // --- Section Title ---
  Widget _buildSectionTitle(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        GestureDetector(
          onTap: () {},
          child: AppText(
            text: action,
            fontSize: 13.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // --- Upcoming Events ---
  Widget _buildUpcomingEvents() {
    return SizedBox(
      height: 170.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _upcomingEvents.length,
        itemBuilder: (context, index) {
          final event = _upcomingEvents[index];
          return Container(
            width: 280.w,
            margin: EdgeInsets.only(right: 16.w),
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  event.accentColor,
                  event.accentColor.withValues(alpha: 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: event.accentColor.withValues(alpha: 0.3),
                  blurRadius: 15.r,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        event.title,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        event.date,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white70,
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        event.location,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 12.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${event.tasksCompleted}/${event.totalTasks} Tasks',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${(event.progress * 100).toInt()}%',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: LinearProgressIndicator(
                        value: event.progress,
                        minHeight: 6.h,
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // --- Quick Actions ---
  Widget _buildQuickActions() {
    final actions = [
      {
        'icon': Icons.add_circle_outline_rounded,
        'label': 'New Event',
        'color': AppColors.primaryColor,
      },
      {
        'icon': Icons.search_rounded,
        'label': 'Find Vendor',
        'color': AppColors.accentColor,
      },
      {
        'icon': Icons.checklist_rounded,
        'label': 'Checklist',
        'color': const Color(0xFF7CB98C),
      },
      {
        'icon': Icons.wallet_rounded,
        'label': 'Budget',
        'color': const Color(0xFF8C7CB9),
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((a) {
        return GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: (a['color'] as Color).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Icon(
                  a['icon'] as IconData,
                  color: a['color'] as Color,
                  size: 28.sp,
                ),
              ),
              SizedBox(height: 8.h),
              AppText(
                text: a['label'] as String,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // --- Services Grid ---
  Widget _buildServicesGrid() {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _services.length,
        itemBuilder: (context, index) {
          final service = _services[index];
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${service.name} selected'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              );
            },
            child: Container(
              width: 140.w,
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      color: service.color,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      service.icon,
                      size: 28.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  AppText(
                    text: service.name,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    text: '₹${service.startingPrice.toInt()}+',
                    fontSize: 11.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // --- Featured Vendors ---
  Widget _buildFeaturedVendors() {
    return Column(
      children: _featuredVendors.map((vendor) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  vendor.icon,
                  color: AppColors.primaryColor,
                  size: 26.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: vendor.name,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    SizedBox(height: 4.h),
                    AppText(
                      text: vendor.category,
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: const Color(0xFFFFB800),
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      AppText(
                        text: '${vendor.rating}',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      AppText(
                        text: ' (${vendor.reviews})',
                        fontSize: 11.sp,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    text: vendor.price,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
