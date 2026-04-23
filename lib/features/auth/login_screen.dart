import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/auth_provider.dart';
import '../../core/auth/user_model.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "MeatTrace",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text("Select Role"),
              const SizedBox(height: 20),

              _buildButton(
                context,
                "Login as Owner",
                    () {
                  ref.read(authProvider.notifier).state = User(
                    id: "1",
                    name: "Amir",
                    role: UserRole.owner,
                  );
                },
              ),

              _buildButton(
                context,
                "Login as Slaughterhouse",
                    () {
                  ref.read(authProvider.notifier).state = User(
                    id: "2",
                    name: "Slaughterhouse",
                    role: UserRole.slaughterhouse,
                  );
                },
              ),

              _buildButton(
                context,
                "Login as Warehouse",
                    () {
                  ref.read(authProvider.notifier).state = User(
                    id: "3",
                    name: "Warehouse",
                    role: UserRole.warehouse,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildButton(BuildContext context, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}