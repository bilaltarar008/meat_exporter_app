import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WarehouseHomeScreen extends ConsumerWidget {
  const WarehouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Warehouse", style: TextStyle(fontSize: 18.sp,  color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.red,
            iconSize: 28.0,
            tooltip: 'Log out of your account',
            onPressed: () {
              FirebaseAuth.instance.signOut();
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

              Text("Overview",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),

              SizedBox(height: 12.h),

              Row(
                children: [
                  _stat("Incoming", "4"),
                  SizedBox(width: 8.w),
                  _stat("Stored", "18"),
                  SizedBox(width: 8.w),
                  _stat("Dispatch", "10"),
                ],
              ),

              SizedBox(height: 20.h),

              Text("Shipments"),
              SizedBox(height: 10.h),

              _shipment("#UAE-992", "2.1°C", true),
              _shipment("#UAE-993", "5.8°C", false),

              SizedBox(height: 20.h),

              Text("Inventory"),
              SizedBox(height: 10.h),

              Row(
                children: [
                  _stat("Total", "1200kg"),
                  SizedBox(width: 8.w),
                  _stat("Capacity", "2000kg"),
                  SizedBox(width: 8.w),
                  _stat("Occupied", "60%"),
                ],
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stat(String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              Text(value, style: TextStyle(fontSize: 16.sp)),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shipment(String id, String temp, bool ok) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(id),
            Text("Temp: $temp"),

            SizedBox(height: 10.h),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Accepted"); // Added a valid action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Sets the button color to red
                      foregroundColor: Colors.black, // Sets the text color to white
                    ),
                    child: Text("Accept"),
                  ),
                ),
                SizedBox(width: 6.w),

                Expanded(child: OutlinedButton(onPressed: () {},  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey, // Sets the button color to red
                  foregroundColor: Colors.white, // Sets the text color to white
                ),
                    child: Text("Scan"))),
                SizedBox(width: 6.w),

                Expanded(child: TextButton(onPressed: () {}, style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Sets the button color to red
                  foregroundColor: Colors.black, // Sets the text color to white
                ),
                    child: Text("Log"))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}