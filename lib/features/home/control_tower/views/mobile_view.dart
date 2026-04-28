import 'package:flutter/material.dart';
import '../widgets/kpi_card.dart';
import '../widgets/shipment_row.dart';

class ControlTowerMobileView extends StatelessWidget {
  const ControlTowerMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Control Tower")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            KpiCard(title: "Active", value: "12"),
            SizedBox(height: 10),
            KpiCard(title: "Cold Storage", value: "3"),
            SizedBox(height: 10),
            KpiCard(title: "Flights", value: "4"),
            SizedBox(height: 20),
            ShipmentRow(id: "PK-001"),
            ShipmentRow(id: "PK-002"),
          ],
        ),
      ),
    );
  }
}