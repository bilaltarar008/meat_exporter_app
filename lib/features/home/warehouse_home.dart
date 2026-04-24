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
        title: Text("Warehouse", style: TextStyle(fontSize: 18.sp)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).state = null;
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 OVERVIEW
              Text("Overview",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 12.h),

              Row(
                children: [
                  _statCard("Incoming", "4"),
                  SizedBox(width: 10.w),
                  _statCard("Stored", "18"),
                  SizedBox(width: 10.w),
                  _statCard("Dispatch", "10"),
                ],
              ),

              SizedBox(height: 20.h),

              /// 🔹 INCOMING SHIPMENTS
              Text("Incoming Shipments",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 12.h),

              Column(
                children: [
                  _shipmentItem("#UAE-992", "2.1°C", true),
                  _shipmentItem("#UAE-993", "5.8°C", false),
                  _shipmentItem("#UAE-995", "6.0°C", false),
                ],
              ),

              SizedBox(height: 20.h),

              /// 🔹 INVENTORY
              Text("Inventory Summary",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 12.h),

              Row(
                children: [
                  _inventoryCard("Total", "1200kg"),
                  SizedBox(width: 10.w),
                  _inventoryCard("Capacity", "2000kg"),
                  SizedBox(width: 10.w),
                  _inventoryCard("Occupied", "60%"),
                ],
              ),

              SizedBox(height: 40.h), // 👈 IMPORTANT bottom spacing
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 STAT CARD
  Widget _statCard(String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            children: [
              Text(value,
                  style: TextStyle(
                      fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 4.h),
              Text(title, style: TextStyle(fontSize: 12.sp)),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 SHIPMENT ITEM (FIXED + ACTIONS)
  Widget _shipmentItem(String id, String temp, bool isGood) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TOP ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(id, style: TextStyle(fontSize: 14.sp)),
                Text(
                  isGood ? "OK" : "Warning",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isGood ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),

            Text("Temp: $temp", style: TextStyle(fontSize: 12.sp)),

            SizedBox(height: 10.h),

            /// ACTION BUTTONS (NO OVERFLOW NOW)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Accept", style: TextStyle(fontSize: 11.sp)),
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Scan QR", style: TextStyle(fontSize: 11.sp)),
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Log Temp", style: TextStyle(fontSize: 11.sp)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 INVENTORY CARD
  Widget _inventoryCard(String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              Text(value,
                  style: TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 4.h),
              Text(title, style: TextStyle(fontSize: 11.sp)),
            ],
          ),
        ),
      ),
    );
  }
}