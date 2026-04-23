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