import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/auth_provider.dart';

class SlaughterhouseHomeScreen extends ConsumerWidget {
  const SlaughterhouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slaughterhouse"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Slaughterhouse Dashboard"),
      ),
    );
  }
}