import 'package:festivo/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:festivo/core/routers/app_router.dart';
import 'package:festivo/core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Add your providers here
        // ChangeNotifierProvider(create: (_) => YourProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Festivo',
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,

            // Force text scale factor to 1
            builder: (context, child) {
              return Container(
                color: AppColors.backgroundColor,
                child: SafeArea(
                  top: false,
                  child: MediaQuery(
                    data: MediaQuery.of(
                      context,
                    ).copyWith(textScaler: TextScaler.noScaling),
                    child: child!,
                  ),
                ),
              );
            },

            theme: AppTheme.lightTheme,
          );
        },
      ),
    );
  }
}
