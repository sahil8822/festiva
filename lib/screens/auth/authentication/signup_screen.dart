import 'package:festivo/components/app_button.dart';
import 'package:festivo/components/app_text.dart';
import 'package:festivo/components/custom_text_field.dart';
import 'package:festivo/components/social_button.dart';
import 'package:festivo/core/theme/app_colors.dart';
import 'package:festivo/screens/auth/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String route = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // Background Decorative Elements
          Positioned(
            top: -100.h,
            right: -100.w,
            child: Container(
              width: 300.w,
              height: 300.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: -50.w,
            child: Container(
              width: 300.w,
              height: 300.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accentColor.withValues(alpha: 0.1),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Custom AppBar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 0.h,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.textPrimary,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20.h),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Evora",
                                style: GoogleFonts.inriaSerif(
                                  fontSize: 48.sp,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2.w,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              AppText(
                                text: "Create your account",
                                fontSize: 16.sp,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),

                        // Form Fields
                        CustomTextField(
                          controller: _nameController,
                          hintText: "Full Name",
                          prefixIcon: Icons.person_outline_rounded,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email Address",
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.lock_outline_rounded,
                          isPassword: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.textSecondary,
                              size: 20.sp,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 32.h),

                        CustomButton(
                          text: "Create Account",
                          onPressed: () {
                            context.go(LoginScreen.route);
                          },
                        ),
                        SizedBox(height: 32.h),

                        // Divider Section
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.textSecondary.withValues(
                                  alpha: 0.2,
                                ),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: AppText(
                                text: "Or continue with",
                                fontSize: 12.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.textSecondary.withValues(
                                  alpha: 0.2,
                                ),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),

                        // Social Login Section
                        SocialButton(
                          icon: Icon(
                            Icons.g_mobiledata_rounded,
                            color: AppColors.googleColor,
                            size: 32.sp,
                          ),
                          text: "Continue with Google",
                          onPressed: () {},
                        ),
                        SizedBox(height: 16.h),
                        SocialButton(
                          icon: Icon(
                            Icons.apple_rounded,
                            color: AppColors.appleColor,
                            size: 24.sp,
                          ),
                          text: "Continue with Apple",
                          onPressed: () {},
                        ),

                        SizedBox(height: 40.h),
                        // Bottom Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: "Already have an account? ",
                              color: AppColors.textSecondary,
                              fontSize: 14.sp,
                            ),
                            GestureDetector(
                              onTap: () => context.pop(),
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
