import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';

class SlaughterhouseHomeScreen extends StatefulWidget {
  const SlaughterhouseHomeScreen({super.key});

  @override
  State<SlaughterhouseHomeScreen> createState() =>
      _SlaughterhouseHomeScreenState();
}

class _SlaughterhouseHomeScreenState
    extends State<SlaughterhouseHomeScreen> {

  String searchQuery = '';
  String selectedFilter = 'all';

  final bgColor = const Color(0xFFF8FAFC);
  final blue = const Color(0xFF2563EB);
  final green = const Color(0xFF16A34A);
  final amber = const Color(0xFFF59E0B);
  final red = const Color(0xFFDC2626);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        title: const Text(
          "Slaughter Operations",
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xFF0F172A),
            ),
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),

      body: StreamBuilder<List<Shipment>>(
        stream: db.watchSlaughterShipments(),

        builder: (context, snapshot) {

          final allShipments = snapshot.data ?? [];

          final shipments = allShipments.where((s) {

            final code =
            (s.shipmentCode ?? '').toLowerCase();

            final title =
            s.title.toLowerCase();

            final matchesSearch =
                code.contains(searchQuery) ||
                    title.contains(searchQuery);

            bool matchesFilter = true;

            if (selectedFilter == 'pending') {
              matchesFilter =
                  s.status.toLowerCase().contains('slaughter');
            }

            if (selectedFilter == 'completed') {
              matchesFilter =
                  s.status.toLowerCase().contains('completed');
            }

            return matchesSearch && matchesFilter;

          }).toList();

          return Column(
            children: [

              /// SEARCH + FILTERS
              Padding(
                padding: EdgeInsets.all(16.w),

                child: Column(
                  children: [

                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search shipments...",
                        prefixIcon: const Icon(Icons.search),

                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),

                      onChanged: (v) {
                        setState(() {
                          searchQuery = v.toLowerCase();
                        });
                      },
                    ),

                    SizedBox(height: 14.h),

                    SizedBox(
                      height: 42.h,

                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [

                          _filterChip('all', 'All'),
                          _filterChip('pending', 'Pending'),
                          _filterChip('completed', 'Completed'),
                        ],
                      ),
                    ),

                    SizedBox(height: 12.h),

                    /// KPI ROW
                    /// KPI ROW
                    Row(
                      children: [

                        Expanded(
                          child: _kpiCard(
                            "Pending",
                            shipments.length.toString(),
                            amber,
                            Icons.pending_actions_rounded,
                          ),
                        ),

                        SizedBox(width: 8.w),

                        Expanded(
                          child: _kpiCard(
                            "Processing",
                            shipments
                                .where((e) =>
                            e.currentStage == 'slaughter')
                                .length
                                .toString(),
                            blue,
                            Icons.precision_manufacturing_rounded,
                          ),
                        ),

                        SizedBox(width: 8.w),

                        Expanded(
                          child: _kpiCard(
                            "Done",
                            allShipments
                                .where((e) =>
                                e.status
                                    .toLowerCase()
                                    .contains('completed'))
                                .length
                                .toString(),
                            green,
                            Icons.check_circle_outline_rounded,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// LIST
              Expanded(
                child: shipments.isEmpty
                    ? const Center(
                  child: Text(
                    "No slaughter tasks",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: shipments.length,

                  itemBuilder: (_, i) {
                    final s = shipments[i];

                    return _shipmentCard(s);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// ================= SHIPMENT CARD =================

  Widget _shipmentCard(Shipment s) {

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: EdgeInsets.all(14.w),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// HEADER
            Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        s.shipmentCode ?? "Shipment",

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF111827),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        s.title,

                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                _statusChip("Processing"),
              ],
            ),

            SizedBox(height: 10.h),

            /// NEXT ACTION
            const Text(
              "Next: Record cuts & upload certificates",

              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),

            SizedBox(height: 12.h),

            /// TRACKER
            _tracker(),

            SizedBox(height: 14.h),

            /// METRICS
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                _metric(
                  "Weight",
                  "${s.weight} kg",
                ),

                _metric(
                  "Stage",
                  "Slaughter",
                ),

                _metric(
                  "Queue",
                  "Active",
                ),
              ],
            ),

            SizedBox(height: 16.h),

            /// ACTION BUTTONS
            Row(
              children: [

                Expanded(
                  child: OutlinedButton.icon(

                    onPressed: () {},

                    icon: const Icon(
                      Icons.upload_file_rounded,
                      size: 18,
                    ),

                    label: const Text(
                      "Documents",
                      style: TextStyle(fontSize: 12),
                    ),

                    style: OutlinedButton.styleFrom(
                      foregroundColor: blue,

                      side: BorderSide(color: blue),

                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: ElevatedButton.icon(

                    onPressed: () async {

                      await db.completeSlaughter(s.id);
                    },

                    icon: const Icon(
                      Icons.check_circle,
                      size: 18,
                    ),

                    label: const Text(
                      "Complete",
                      style: TextStyle(fontSize: 12),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,

                      foregroundColor: Colors.white,

                      elevation: 0,

                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ================= HELPERS =================
  Widget _kpiCard(
      String title,
      String value,
      Color color,
      IconData icon,
      ) {

    return Container(
      height: 115.h,

      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [

          Container(
            padding: EdgeInsets.all(5.w),

            decoration: BoxDecoration(
              color: color.withOpacity(0.10),

              borderRadius:
              BorderRadius.circular(10),
            ),

            child: Icon(
              icon,
              color: color,
              size: 16.sp,
            ),
          ),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                value,

                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                  height: 1,
                ),
              ),

              SizedBox(height: 2.h),

              Text(
                title,

                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64748B),
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String value, String label) {

    final selected = selectedFilter == value;

    return Padding(
      padding: EdgeInsets.only(right: 10.w),

      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = value;
          });
        },

        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 10.h,
          ),

          decoration: BoxDecoration(
            color: selected ? blue : Colors.white,

            borderRadius: BorderRadius.circular(30),

            border: Border.all(
              color: selected
                  ? blue
                  : const Color(0xFFE2E8F0),
            ),
          ),

          child: Text(
            label,

            style: TextStyle(
              fontWeight: FontWeight.w600,

              color: selected
                  ? Colors.white
                  : const Color(0xFF475569),
            ),
          ),
        ),
      ),
    );
  }

  Widget _statusChip(String text) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),

      decoration: BoxDecoration(
        color: amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),

      child: Text(
        text,

        style: TextStyle(
          color: amber,
          fontWeight: FontWeight.w600,
          fontSize: 9.sp,
        ),
      ),
    );
  }

  Widget _infoTile(
      String label,
      String value,
      IconData icon,
      ) {

    return Container(
      padding: EdgeInsets.all(14.w),

      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(8),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              size: 18,
              color: blue,
            ),
          ),

          SizedBox(width: 8.w),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 9,
                ),
              ),

              SizedBox(height: 2.h),

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timelineStep(bool done, String title) {

    return Column(
      children: [

        CircleAvatar(
          radius: 7,

          backgroundColor:
          done ? green : Colors.grey.shade300,

          child: Icon(
            done ? Icons.check : Icons.circle,
            size: 9,
            color: Colors.white,
          ),
        ),

        SizedBox(height: 6.h),

        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            color: done ? green : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _tracker() {

    return Row(
      children: [

        _circle(true, "Purchase"),
        _divider(true),

        _circle(true, "Slaughter"),
        _divider(false),

        _circle(false, "Warehouse"),
      ],
    );
  }

  Widget _circle(bool active, String label) {

    return Column(
      children: [

        CircleAvatar(
          radius: 5,

          backgroundColor:
          active
              ? Colors.orange
              : Colors.grey.shade300,
        ),

        const SizedBox(height: 4),

        Text(
          label,

          style: TextStyle(
            fontSize: 10,
            color: active
                ? Colors.orange
                : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _divider(bool active) {

    return Expanded(
      child: Container(
        height: 2,

        color: active
            ? Colors.orange
            : Colors.grey.shade300,
      ),
    );
  }

  Widget _metric(
      String label,
      String value,
      ) {

    return Column(
      children: [

        Text(
          label,

          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF9CA3AF),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }

  Widget _line(bool active) {

    return Expanded(
      child: Container(
        height: 2,
        margin: EdgeInsets.only(bottom: 18.h),

        color: active
            ? green
            : Colors.grey.shade300,
      ),
    );
  }
}