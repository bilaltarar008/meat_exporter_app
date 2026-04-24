import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildActions(context),
            SizedBox(height: 20.h),
            _buildBatchList(),
          ],
        ),
      ),
    );
  }

  // 🔹 ACTION BUTTONS
  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        ActionCard(title: "New Batch", icon: Icons.add_box),
        ActionCard(title: "QC Check", icon: Icons.check_circle),
        ActionCard(title: "Upload Docs", icon: Icons.upload),
      ],
    );
  }

  // 🔹 ACTIVE BATCHES
  Widget _buildBatchList() {
    return Expanded(
      child: ListView(
        children: const [
          BatchItem(id: "#PK-221", weight: "120kg", status: "Processed"),
          BatchItem(id: "#PK-221", weight: "120kg", status: "Processed"),
          BatchItem(id: "#PK-222", weight: "95kg", status: "Pending QC"),
        ],
      ),
    );
  }
}

// 🔹 ACTION CARD
class ActionCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ActionCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              Icon(icon, size: 28.sp),
              SizedBox(height: 6.h),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 BATCH ITEM
class BatchItem extends StatelessWidget {
  final String id;
  final String weight;
  final String status;

  const BatchItem({
    super.key,
    required this.id,
    required this.weight,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(id),
        subtitle: Text("Weight: $weight"),
        trailing: Text(status),
      ),
    );
  }
}