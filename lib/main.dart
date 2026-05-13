import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'core/theme/app_theme.dart';
import 'core/services/sync_service.dart';

import 'features/home/home_router.dart';
import 'features/home/owner_home.dart';
import 'features/home/slaughterhouse_home.dart';
import 'features/home/warehouse_home.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SyncService().start();

  runApp(

    ProviderScope(

      child: ScreenUtilInit(

        designSize: const Size(1440, 1024),

        minTextAdapt: true,

        splitScreenMode: true,

        builder: (_, child) {

          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,

      themeMode: ThemeMode.light,

      home: const HomeRouter(),

      routes: {

        '/owner': (_) =>
        const OwnerHomeScreen(),

        '/slaughter': (_) =>
        const SlaughterhouseHomeScreen(),

        '/manager': (_) =>
        const WarehouseHomeScreen(),
      },
    );
  }
}