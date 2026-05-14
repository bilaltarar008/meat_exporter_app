import 'package:flutter/material.dart';
import '../../core/services/firestore_provider.dart';

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

  final coldStorageController =
  TextEditingController();

  final freightController =
  TextEditingController();

  final airportController =
  TextEditingController();

  final netWeightController =
  TextEditingController();

  final damagedController =
  TextEditingController();

  final notesController =
  TextEditingController();

  bool loading = false;

  Future<void> _submit() async {

    final coldStorage =
    double.tryParse(
      coldStorageController.text,
    );

    final freight =
    double.tryParse(
      freightController.text,
    );

    final airport =
    double.tryParse(
      airportController.text,
    );

    final netWeight =
    double.tryParse(
      netWeightController.text,
    );

    final damaged =
        double.tryParse(
          damagedController.text,
        ) ??
            0;

    if (coldStorage == null ||
        coldStorage <= 0) {

      _error(
        "Enter valid cold storage cost",
      );

      return;
    }

    if (freight == null ||
        freight <= 0) {

      _error(
        "Enter valid freight cost",
      );

      return;
    }

    if (airport == null ||
        airport <= 0) {

      _error(
        "Enter valid airport handling cost",
      );

      return;
    }

    if (netWeight == null ||
        netWeight <= 0) {

      _error(
        "Enter valid net sale weight",
      );

      return;
    }

    setState(() {
      loading = true;
    });

    await firestoreService.shipments
        .doc(widget.shipmentId)
        .update({

      'coldStorageCost':
      coldStorage,

      'freightCost':
      freight,

      'airportHandlingCost':
      airport,

      'netSaleWeight':
      netWeight,

      'damagedStock':
      damaged,

      'warehouseNotes':
      notesController.text.trim(),

      'currentStage': 'completed',

      'status':
      'Shipment Completed',

      'nextAction':
      'Workflow completed',

      'paymentStatus':
      'Completed',
    });

    await firestoreService
        .addWarehouseExpense(

      docId: widget.shipmentId,

      amount: coldStorage,
    );

    await firestoreService
        .addFreightExpense(

      docId: widget.shipmentId,

      amount: freight,
    );

    await firestoreService
        .addAirportHandlingExpense(

      docId: widget.shipmentId,

      amount: airport,
    );

    await firestoreService
        .recalculateShipmentFinancials(
      widget.shipmentId,
    );

    if (context.mounted) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            "Shipment completed successfully",
          ),
        ),
      );

      Navigator.pop(context);
    }
  }

  void _error(String message) {

    ScaffoldMessenger.of(context)
        .showSnackBar(

      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFFF8FAFC),

      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        title: const Text(
          "Warehouse Operations",
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Text(

              "Warehouse Completion",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),

            const SizedBox(height: 8),

            const Text(

              "Finalize shipment operational and logistics information before completion.",

              style: TextStyle(
                color: Color(0xFF64748B),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            _field(
              coldStorageController,
              "Cold Storage Cost",
              Icons.ac_unit_rounded,
            ),

            _field(
              freightController,
              "Freight Cost",
              Icons.flight_takeoff_rounded,
            ),

            _field(
              airportController,
              "Airport Handling Cost",
              Icons.local_shipping_outlined,
            ),

            _field(
              netWeightController,
              "Net Sale Weight",
              Icons.scale_rounded,
            ),

            _field(
              damagedController,
              "Damaged Stock",
              Icons.warning_amber_rounded,
            ),

            _field(
              notesController,
              "Warehouse Notes",
              Icons.description_outlined,
              maxLines: 5,
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed:
                loading ? null : _submit,

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.green,

                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 16,
                  ),

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                      16,
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
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )

                    : const Text(

                  "Complete Shipment",

                  style: TextStyle(
                    color: Colors.white,
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
      const EdgeInsets.only(bottom: 18),

      child: TextField(

        controller: controller,

        maxLines: maxLines,

        decoration: InputDecoration(

          labelText: label,

          prefixIcon: Icon(icon),

          filled: true,

          fillColor: Colors.white,

          border: OutlineInputBorder(

            borderRadius:
            BorderRadius.circular(18),

            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}