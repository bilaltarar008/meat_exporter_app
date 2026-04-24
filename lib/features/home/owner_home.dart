// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../core/auth/auth_provider.dart';
//
// class OwnerHomeScreen extends ConsumerWidget {
//   const OwnerHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Owner Dashboard"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               ref.read(authProvider.notifier).state = null;
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _buildKPI("Active Shipments", "12"),
//             _buildKPI("In Transit", "5"),
//             _buildKPI("Delivered", "20"),
//             _buildKPI("Alerts", "2"),
//
//             const SizedBox(height: 20),
//
//             _buildCard("Shipment #UAE-992", "Karachi → Dubai", "2.1°C"),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildKPI(String title, String value) {
//     return Card(
//       child: ListTile(
//         title: Text(title),
//         trailing: Text(
//           value,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCard(String title, String route, String temp) {
//     return Card(
//       child: ListTile(
//         title: Text(title),
//         subtitle: Text(route),
//         trailing: Text(temp),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/auth/auth_provider.dart';
import '../../core/database/database_provider.dart';
import '../../core/database/app_database.dart';

class OwnerHomeScreen extends ConsumerWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(fontSize: 18.sp)),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 20.h),

              _buildKPIGrid(),
              SizedBox(height: 20.h),

              ElevatedButton(
                onPressed: () async {
                  await db.insertShipment(
                    ShipmentsCompanion.insert(
                      id: DateTime.now().toString(),
                      origin: "Karachi",
                      destination: "Dubai",
                      temperature: 2.5,
                      status: "In Transit",
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Shipment Added"),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text("Add Shipment", style: TextStyle(fontSize: 14.sp)),
              ),

              SizedBox(height: 20.h),

              _buildShipmentList(ref),

              SizedBox(height: 20.h),
              _buildAlerts(),

              SizedBox(height: 20.h),
              _buildActivity(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Welcome, Owner",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        const Icon(Icons.notifications),
      ],
    );
  }

  Widget _buildKPIGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      children: const [
        KPIBox(title: "Active", value: "12"),
        KPIBox(title: "In Transit", value: "5"),
        KPIBox(title: "Delivered", value: "20"),
        KPIBox(title: "Alerts", value: "2"),
      ],
    );
  }

  Widget _buildShipmentList(WidgetRef ref) {
    final db = ref.watch(dbProvider);

    return StreamBuilder(
      stream: db.watchShipments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final shipments = snapshot.data!;

        if (shipments.isEmpty) {
          return Text("No shipments yet", style: TextStyle(fontSize: 14.sp));
        }

        return Column(
          children: shipments.map((s) {
            return Card(
              child: ListTile(
                title: Text(s.id, style: TextStyle(fontSize: 14.sp)),
                subtitle: Text(
                  "${s.origin} → ${s.destination}",
                  style: TextStyle(fontSize: 12.sp),
                ),
                trailing: Text(
                  "${s.temperature}°C",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildAlerts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Alerts", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        Card(
          child: ListTile(
            leading: const Icon(Icons.warning, color: Colors.red),
            title: Text("Temperature spike detected", style: TextStyle(fontSize: 12.sp)),
            subtitle: Text("Shipment #UAE-221", style: TextStyle(fontSize: 11.sp)),
          ),
        ),
      ],
    );
  }

  Widget _buildActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent Activity", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        ActivityItem(text: "AWB uploaded"),
        ActivityItem(text: "Shipment departed"),
        ActivityItem(text: "Batch processed"),
      ],
    );
  }
}

class KPIBox extends StatelessWidget {
  final String title;
  final String value;

  const KPIBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h),
            Text(title, style: TextStyle(fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String text;

  const ActivityItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8),
          SizedBox(width: 8.w),
          Text(text, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }
}