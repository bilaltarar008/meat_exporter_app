import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/services/firestore_provider.dart';
import 'shipment_workflow_service.dart';
import 'shipment_status.dart';

class SlaughterhouseProcessingScreen
    extends StatefulWidget {

  final String shipmentId;

  const SlaughterhouseProcessingScreen({
    super.key,
    required this.shipmentId,
  });

  @override
  State<SlaughterhouseProcessingScreen>
  createState() =>
      _SlaughterhouseProcessingScreenState();
}

class MeatItem {

  final TextEditingController nameController;
  final TextEditingController weightController;

  MeatItem()
      : nameController = TextEditingController(),
        weightController = TextEditingController();
}

class _SlaughterhouseProcessingScreenState
    extends State<SlaughterhouseProcessingScreen> {

  final slaughterCostController =
  TextEditingController();

  final wastageController =
  TextEditingController();

  final slaughterNotesController =
  TextEditingController();

  final List<MeatItem> meatItems = [
    MeatItem(),
  ];

  bool loading = false;

  Future<void> _submit() async {

    final slaughterCost =
    double.tryParse(
      slaughterCostController.text,
    );

    final wastage =
        double.tryParse(
          wastageController.text,
        ) ?? 0;

    if (slaughterCost == null ||
        slaughterCost <= 0) {

      _error(
        "Enter valid slaughter cost",
      );

      return;
    }

    final List<Map<String, dynamic>>
    formattedMeatItems = [];

    double totalWeight = 0;

    for (final item in meatItems) {

      final name =
      item.nameController.text.trim();

      final weight =
          double.tryParse(
            item.weightController.text,
          ) ??
              0;

      if (name.isEmpty || weight <= 0) {
        continue;
      }

      formattedMeatItems.add({

        'name': name,
        'weight': weight,
      });

      totalWeight += weight;
    }

    if (formattedMeatItems.isEmpty) {

      _error(
        "Add at least one meat item",
      );

      return;
    }

    setState(() {
      loading = true;
    });

    try {

      await FirebaseFirestore.instance
          .collection('shipments')
          .doc(widget.shipmentId)
          .update({

        'wastageWeight':
        wastage,

        'slaughterhouseCost':
        slaughterCost,

        'meatItems':
        formattedMeatItems,

        'carcassWeight':
        totalWeight,

        'slaughterNotes':
        slaughterNotesController
            .text
            .trim(),

        'currentStage':
        'warehouse',

        'status':
        ShipmentStatus
            .animalsSlaughtered
            .label,

        'updatedAt':
        FieldValue.serverTimestamp(),
      });

      await firestoreService
          .addSlaughterExpense(

        docId:
        widget.shipmentId,

        amount:
        slaughterCost,
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
            .animalsSlaughtered
            .label,

        note:
        slaughterNotesController
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
            "Shipment moved to warehouse successfully",
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

    return Scaffold(

      backgroundColor:
      const Color(0xFFF8FAFC),

      appBar: AppBar(

        backgroundColor:
        Colors.white,

        elevation: 0,

        title: const Text(

          "Slaughterhouse Processing",

          style: TextStyle(

            color:
            Color(0xFF0F172A),

            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Text(

              "Processing Information",

              style: TextStyle(

                fontSize: 24,

                fontWeight:
                FontWeight.bold,

                color:
                Color(0xFF0F172A),
              ),
            ),

            const SizedBox(height: 8),

            const Text(

              "Complete slaughterhouse processing before moving shipment to warehouse.",

              style: TextStyle(

                color:
                Color(0xFF64748B),

                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            const Align(

              alignment:
              Alignment.centerLeft,

              child: Text(

                "Meat Breakdown",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            ...List.generate(
              meatItems.length,
                  (index) {

                final item =
                meatItems[index];

                return Padding(

                  padding:
                  const EdgeInsets.only(
                    bottom: 16,
                  ),

                  child: Row(

                    children: [

                      Expanded(

                        flex: 2,

                        child: TextField(

                          controller:
                          item.nameController,

                          decoration:
                          InputDecoration(

                            hintText:
                            "Mutton / Ribs",

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
                      ),

                      const SizedBox(width: 12),

                      Expanded(

                        child: TextField(

                          controller:
                          item.weightController,

                          keyboardType:
                          TextInputType.number,

                          decoration:
                          InputDecoration(

                            hintText:
                            "KG",

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
                      ),
                    ],
                  ),
                );
              },
            ),

            Align(

              alignment:
              Alignment.centerRight,

              child: TextButton.icon(

                onPressed: () {

                  setState(() {

                    meatItems.add(
                      MeatItem(),
                    );
                  });
                },

                icon:
                const Icon(Icons.add),

                label: const Text(
                  "Add More Meat",
                ),
              ),
            ),

            _field(

              slaughterCostController,

              "Slaughter Cost",

              Icons.payments_outlined,
            ),

            _field(

              wastageController,

              "Wastage Weight",

              Icons.warning_amber_rounded,
            ),

            _field(

              slaughterNotesController,

              "Operational Notes",

              Icons.description_outlined,

              maxLines: 5,
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
                  Colors.orange,

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

                  "Move To Warehouse",

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