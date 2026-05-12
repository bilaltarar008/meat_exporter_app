import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/sync_service.dart';

import 'features/home/owner_home.dart';
import 'features/home/slaughterhouse_home.dart';
import 'features/home/warehouse_home.dart';

import 'features/home/home_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SyncService().start();

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
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

      /// ✅ LIGHT PROFESSIONAL THEME
      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor: const Color(0xFFF3F4F6),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),

        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xFF111827),
          ),
        ),
      ),

      home: const HomeRouter(),

      routes: {
        '/owner': (_) => const OwnerHomeScreen(),
        '/slaughter': (_) => const SlaughterhouseHomeScreen(),
        '/manager': (_) => const WarehouseHomeScreen(),
      },
    );
  }
}