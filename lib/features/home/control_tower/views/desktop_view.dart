import 'package:flutter/material.dart';
import '../widgets/kpi_card.dart';
import '../widgets/shipment_row.dart';
import '../widgets/alert_card.dart';

class ControlTowerDesktopView extends StatelessWidget {
  const ControlTowerDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// 🔹 SIDEBAR
          Container(
            width: 260,
            color: const Color(0xFF0F2A1D),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("ExportOps",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                ListTile(title: Text("Control Tower", style: TextStyle(color: Colors.white))),
                ListTile(title: Text("Shipment Timeline", style: TextStyle(color: Colors.white))),
                ListTile(title: Text("Create Shipment", style: TextStyle(color: Colors.white))),
              ],
            ),
          ),

          /// 🔹 MAIN CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Shipment Control Tower",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Create shipment"),
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// KPI ROW
                  Row(
                    children: const [
                      Expanded(child: KpiCard(title: "Active", value: "12")),
                      SizedBox(width: 12),
                      Expanded(child: KpiCard(title: "Cold Storage", value: "3")),
                      SizedBox(width: 12),
                      Expanded(child: KpiCard(title: "Flights", value: "4")),
                      SizedBox(width: 12),
                      Expanded(child: KpiCard(title: "Revenue", value: "\$82k")),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// MAIN AREA
                  Expanded(
                    child: Row(
                      children: [
                        /// SHIPMENTS
                        Expanded(
                          flex: 3,
                          child: Card(
                            child: ListView(
                              padding: const EdgeInsets.all(12),
                              children: const [
                                ShipmentRow(id: "PK-001"),
                                ShipmentRow(id: "PK-002"),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        /// ALERTS
                        Expanded(
                          flex: 1,
                          child: Card(
                            child: ListView(
                              padding: const EdgeInsets.all(12),
                              children: const [
                                Text("Needs Attention"),
                                SizedBox(height: 10),
                                AlertCard(text: "Missing document"),
                                AlertCard(text: "Payment due"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}