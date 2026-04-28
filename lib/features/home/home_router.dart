import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/auth_provider.dart';
import '../auth/login_screen.dart';
import 'owner_home.dart';
import 'slaughterhouse_home.dart';
import 'warehouse_home.dart';

class HomeRouter extends ConsumerWidget {
  const HomeRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          return const LoginScreen();
        }

        /// 🔥 ROLE MAPPING (TEMP LOGIC)
        final email = user.email ?? "";

        if (email == "owner@test.com") {
          return const OwnerHomeScreen();
        } else if (email == "slaughter@test.com") {
          return const SlaughterhouseHomeScreen();
        } else {
          return const WarehouseHomeScreen();
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const Scaffold(
        body: Center(child: Text("Error")),
      ),
    );
  }
}