import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/services/firestore_provider.dart';
import 'shipment_status.dart';
import 'shipment_workflow_service.dart';

class WarehouseProcessingScreen
    extends StatefulWidget {

  final String shipmentId;

  const WarehouseProcessingScreen({
    super.key,
    required this.shipmentId,
  });

  @override
  State<WarehouseProcessingScreen>
  createState() =>
      _WarehouseProcessingScreenState();
}

class _WarehouseProcessingScreenState
    extends State<WarehouseProcessingScreen> {

  final warehouseCostController =
  TextEditingController();

  final warehouseNotesController =
  TextEditingController();

  bool loading = false;

  Map<String, dynamic>? shipment;

  @override
  void initState() {
    super.initState();
    _loadShipment();
  }

  Future<void> _loadShipment() async {

    final doc =
    await FirebaseFirestore.instance
        .collection('shipments')
        .doc(widget.shipmentId)
        .get();

    shipment = doc.data();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _submit() async {

    final warehouseCost =
        double.tryParse(
          warehouseCostController.text,
        ) ?? 0;

    setState(() {
      loading = true;
    });

    try {

      await FirebaseFirestore.instance
          .collection('shipments')
          .doc(widget.shipmentId)
          .update({

        'warehouseCost':
        warehouseCost,

        'warehouseNotes':
        warehouseNotesController
            .text
            .trim(),

        'currentStage':
        'transit',

        'status':
        ShipmentStatus
            .warehouseReceived
            .label,

        'updatedAt':
        FieldValue.serverTimestamp(),
      });

      final totalWarehouseExpense =
          warehouseCost;

      await firestoreService
          .addWarehouseExpense(

        docId:
        widget.shipmentId,

        amount:
        totalWarehouseExpense,
      );

      await firestoreService
          .recalculateShipmentFinancials(
        widget.shipmentId,
      );

      await shipmentWorkflowService
          .updateShipmentStatus(

        shipmentId:
        widget.shipmentId,

        status:
        ShipmentStatus
        .warehouseReceived
        .label,

        note:
        warehouseNotesController
            .text
            .trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          backgroundColor:
          Colors.green,

          content: Text(
            "Shipment moved to transit successfully",
          ),
        ),
      );

      Navigator.pop(context);

    } catch (e) {

      _error(
        "Failed: $e",
      );

    } finally {

      if (mounted) {

        setState(() {
          loading = false;
        });
      }
    }
  }

  void _error(String message) {

    ScaffoldMessenger.of(context)
        .showSnackBar(

      SnackBar(

        backgroundColor:
        Colors.red,

        content:
        Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final meatItems =
        shipment?['meatItems'] ?? [];

    return Scaffold(

      backgroundColor:
      const Color(0xFFF8FAFC),

      appBar: AppBar(

        backgroundColor:
        Colors.white,

        elevation: 0,

        title: const Text(

          "Warehouse Processing",

          style: TextStyle(

            color:
            Color(0xFF0F172A),

            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),

      body:
      shipment == null

          ? const Center(
        child:
        CircularProgressIndicator(),
      )

          : SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Text(

              "Received Meat Items",

              style: TextStyle(

                fontSize: 22,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ...List.generate(
              meatItems.length,
                  (index) {

                final item =
                meatItems[index];

                return Container(

                  margin:
                  const EdgeInsets.only(
                    bottom: 14,
                  ),

                  padding:
                  const EdgeInsets.all(
                    16,
                  ),

                  decoration:
                  BoxDecoration(

                    color:
                    Colors.white,

                    borderRadius:
                    BorderRadius.circular(
                      18,
                    ),
                  ),

                  child: Row(

                    children: [

                      Expanded(

                        child: Text(

                          item['name'] ??
                              '',

                          style:
                          const TextStyle(

                            fontWeight:
                            FontWeight.bold,

                            fontSize: 16,
                          ),
                        ),
                      ),

                      Text(

                        "${item['weight']} KG",

                        style:
                        const TextStyle(

                          color:
                          Colors.blue,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            _field(
              warehouseNotesController,
              "Warehouse Notes",
              Icons.description_outlined,
              maxLines: 5,
            ),

            _field(
              warehouseCostController,
              "Warehouse Cost",
              Icons.payments_outlined,
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed:
                loading
                    ? null
                    : _submit,

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.green,

                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 18,
                  ),

                  shape:
                  RoundedRectangleBorder(

                    borderRadius:
                    BorderRadius.circular(
                      18,
                    ),
                  ),
                ),

                child:
                loading

                    ? const SizedBox(

                  height: 22,
                  width: 22,

                  child:
                  CircularProgressIndicator(

                    color:
                    Colors.white,

                    strokeWidth: 2,
                  ),
                )

                    : const Text(

                  "Move To Transit",

                  style: TextStyle(

                    color:
                    Colors.white,

                    fontWeight:
                    FontWeight.bold,

                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(
      TextEditingController controller,
      String label,
      IconData icon, {
        int maxLines = 1,
      }) {

    return Padding(

      padding:
      const EdgeInsets.only(
        bottom: 18,
      ),

      child: TextField(

        controller:
        controller,

        maxLines:
        maxLines,

        decoration:
        InputDecoration(

          labelText:
          label,

          prefixIcon:
          Icon(icon),

          filled: true,

          fillColor:
          Colors.white,

          border:
          OutlineInputBorder(

            borderRadius:
            BorderRadius.circular(
              18,
            ),

            borderSide:
            BorderSide.none,
          ),
        ),
      ),
    );
  }
}