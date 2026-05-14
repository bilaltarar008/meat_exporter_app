import 'package:flutter/material.dart';
import '../../core/services/firestore_provider.dart';

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

class _SlaughterhouseProcessingScreenState
    extends State<SlaughterhouseProcessingScreen> {

  final carcassWeightController =
  TextEditingController();

  final slaughterCostController =
  TextEditingController();

  final wastageController =
  TextEditingController();

  final notesController =
  TextEditingController();

  bool loading = false;

  Future<void> _submit() async {

    final carcassWeight =
    double.tryParse(
      carcassWeightController.text,
    );

    final slaughterCost =
    double.tryParse(
      slaughterCostController.text,
    );

    final wastage =
        double.tryParse(
          wastageController.text,
        ) ??
            0;

    if (carcassWeight == null ||
        carcassWeight <= 0) {

      _error("Enter valid carcass weight");
      return;
    }

    if (slaughterCost == null ||
        slaughterCost <= 0) {

      _error("Enter valid slaughter cost");
      return;
    }

    setState(() {
      loading = true;
    });

    await firestoreService.shipments
        .doc(widget.shipmentId)
        .update({

      'carcassWeight': carcassWeight,

      'wastageWeight': wastage,

      'slaughterhouseCost':
      slaughterCost,

      'slaughterNotes':
      notesController.text.trim(),

      'currentStage': 'warehouse',

      'status':
      'Processing Completed',

      'nextAction':
      'Warehouse operations pending',
    });

    await firestoreService
        .addSlaughterExpense(

      docId: widget.shipmentId,

      amount: slaughterCost,
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
            "Processing completed successfully",
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
          "Slaughterhouse Processing",
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

              "Processing Information",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),

            const SizedBox(height: 8),

            const Text(

              "Complete slaughterhouse operational details before transferring shipment to warehouse.",

              style: TextStyle(
                color: Color(0xFF64748B),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            _field(
              carcassWeightController,
              "Carcass Weight (KG)",
              Icons.scale_rounded,
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
              notesController,
              "Processing Notes",
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
                  Colors.orange,

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

                  "Transfer To Warehouse",

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