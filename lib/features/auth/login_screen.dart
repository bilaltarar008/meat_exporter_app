import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/auth_provider.dart';
import '../../core/auth/user_model.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Role")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).state = User(
                  id: "1",
                  name: "Amir",
                  role: UserRole.owner,
                );
              },
              child: const Text("Login as Owner"),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).state = User(
                  id: "2",
                  name: "Slaughterhouse User",
                  role: UserRole.slaughterhouse,
                );
              },
              child: const Text("Login as Slaughterhouse"),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).state = User(
                  id: "3",
                  name: "Warehouse Manager",
                  role: UserRole.warehouse,
                );
              },
              child: const Text("Login as Warehouse"),
            ),
          ],
        ),
      ),
    );
  }
}