import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/auth/auth_provider.dart';

class WarehouseHomeScreen extends ConsumerWidget {
  const WarehouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warehouse"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildStats(),
            SizedBox(height: 20.h),
            _buildShipmentList(context),
          ],
        ),
      ),
    );
  }

  // 🔹 QUICK STATS
  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        StatBox(title: "Incoming", value: "4"),
        StatBox(title: "Stored", value: "18"),
        StatBox(title: "Dispatched", value: "10"),
      ],
    );
  }

  // 🔹 SHIPMENT LIST
  Widget _buildShipmentList(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ShipmentItem(
            id: "#UAE-992",
            temp: "2.1°C",
            status: "Arrived",
          ),
          ShipmentItem(
            id: "#UAE-993",
            temp: "5.8°C",
            status: "Warning",
          ),
        ],
      ),
    );
  }
}

// 🔹 STAT BOX
class StatBox extends StatelessWidget {
  final String title;
  final String value;

  const StatBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
            Text(
            value,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 SHIPMENT ITEM
class ShipmentItem extends StatelessWidget {
  final String id;
  final String temp;
  final String status;

  const ShipmentItem({
    super.key,
    required this.id,
    required this.temp,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isGood = temp.contains("2") || temp.contains("3");

    return Card(
      child: ListTile(
        title: Text(id),
        subtitle: Text("Temp: $temp"),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              status,
              style: TextStyle(
                color: isGood
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Accept"),
            ),
          ],
        ),
      ),
    );
  }
}