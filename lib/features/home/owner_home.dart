import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/auth_provider.dart';

class OwnerHomeScreen extends ConsumerWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Owner Dashboard"),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildKPI("Active Shipments", "12"),
            _buildKPI("In Transit", "5"),
            _buildKPI("Delivered", "20"),
            _buildKPI("Alerts", "2"),

            const SizedBox(height: 20),

            _buildCard("Shipment #UAE-992", "Karachi → Dubai", "2.1°C"),
          ],
        ),
      ),
    );
  }

  Widget _buildKPI(String title, String value) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String route, String temp) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(route),
        trailing: Text(temp),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../core/auth/auth_provider.dart';
// import '../../core/database/database_provider.dart';
// import '../../core/database/app_database.dart';
//
// class OwnerHomeScreen extends ConsumerWidget {
//   const OwnerHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dashboard"),
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
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildHeader(),
//               const SizedBox(height: 20),
//
//               _buildKPIGrid(),
//               const SizedBox(height: 20),
//
//               // ✅ TEST BUTTON (DB INSERT)
//               ElevatedButton(
//                 onPressed: () async {
//                   final db = ref.read(dbProvider);
//
//                   await db.insertShipment(
//                     ShipmentsCompanion.insert(
//                       id: DateTime.now().toString(),
//                       origin: "Karachi",
//                       destination: "Dubai",
//                       temperature: 2.5,
//                       status: "In Transit",
//                     ),
//                   );
//                 },
//                 child: const Text("Add Shipment (Test)"),
//               ),
//
//               const SizedBox(height: 20),
//
//               // ✅ REAL DATA FROM DB
//               _buildShipmentList(ref),
//
//               const SizedBox(height: 20),
//               _buildAlerts(),
//
//               const SizedBox(height: 20),
//               _buildActivity(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // 🔹 HEADER
//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: const [
//         Text(
//           "Welcome, Amir",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         Icon(Icons.notifications),
//       ],
//     );
//   }
//
//   // 🔹 KPI GRID
//   Widget _buildKPIGrid() {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       crossAxisSpacing: 12,
//       mainAxisSpacing: 12,
//       children: const [
//         KPIBox(title: "Active", value: "12"),
//         KPIBox(title: "In Transit", value: "5"),
//         KPIBox(title: "Delivered", value: "20"),
//         KPIBox(title: "Alerts", value: "2"),
//       ],
//     );
//   }
//
//   // 🔹 SHIPMENT LIST FROM DB
//   Widget _buildShipmentList(WidgetRef ref) {
//     final db = ref.watch(dbProvider);
//
//     return FutureBuilder<List<Shipment>>(
//       future: db.getAllShipments(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const CircularProgressIndicator();
//         }
//
//         final shipments = snapshot.data!;
//
//         if (shipments.isEmpty) {
//           return const Text("No shipments yet");
//         }
//
//         return Column(
//           children: shipments.map((s) {
//             return Card(
//               child: ListTile(
//                 title: Text(s.id),
//                 subtitle: Text("${s.origin} → ${s.destination}"),
//                 trailing: Text("${s.temperature}°C"),
//               ),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
//
//   // 🔹 ALERTS
//   Widget _buildAlerts() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Alerts", style: TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 10),
//         Card(
//           child: ListTile(
//             leading: const Icon(Icons.warning, color: Colors.red),
//             title: const Text("Temperature spike detected"),
//             subtitle: const Text("Shipment #UAE-221"),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // 🔹 ACTIVITY
//   Widget _buildActivity() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: const [
//         Text("Recent Activity", style: TextStyle(fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         ActivityItem(text: "AWB uploaded"),
//         ActivityItem(text: "Shipment departed"),
//         ActivityItem(text: "Batch processed"),
//       ],
//     );
//   }
// }
//
// // 🔹 KPI BOX
// class KPIBox extends StatelessWidget {
//   final String title;
//   final String value;
//
//   const KPIBox({super.key, required this.title, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               value,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(title),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // 🔹 ACTIVITY ITEM
// class ActivityItem extends StatelessWidget {
//   final String text;
//
//   const ActivityItem({super.key, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           const Icon(Icons.circle, size: 8),
//           const SizedBox(width: 8),
//           Text(text),
//         ],
//       ),
//     );
//   }
// }