import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

        final uid = user.uid;

        return FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            final data = snapshot.data!.data() as Map<String, dynamic>?;

            if (data == null) {
              return const Scaffold(
                body: Center(child: Text("User data missing")),
              );
            }

            final role = data['role'];

            print("ROLE FROM FIRESTORE: $role");

            if (role == 'owner') {
              return const OwnerHomeScreen();
            } else if (role == 'slaughter') {
              return const SlaughterhouseHomeScreen();
            } else if (role == 'manager') {
              return const WarehouseHomeScreen();
            } else {
              return const Scaffold(
                body: Center(child: Text("Invalid role")),
              );
            }
          },
        );
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