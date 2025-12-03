import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/localization/localization_model.dart';
import 'config/routes/app_routes.dart';
import 'config/server_locator/injection_container.dart';
import 'config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocale, englishLocale],
      path: assetPathLocalization,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard Figma mobile frame
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: arabicLocale,
          title: 'Flutter Clean Architecture',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialRoute: AppRoutes.productDetailsPage,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
