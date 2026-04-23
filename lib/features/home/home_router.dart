import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/auth/auth_provider.dart';
import '../../core/auth/user_model.dart';
import '../auth/login_screen.dart';

import 'owner_home.dart';
import 'slaughterhouse_home.dart';
import 'warehouse_home.dart';

class HomeRouter extends ConsumerWidget {
  const HomeRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    if (user == null) {
      return const LoginScreen();
    }

    switch (user.role) {
      case UserRole.owner:
        return OwnerHomeScreen();
      case UserRole.slaughterhouse:
        return SlaughterhouseHomeScreen();
      case UserRole.warehouse:
        return WarehouseHomeScreen();
    }
  }
}