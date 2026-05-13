import 'package:flutter/material.dart';
import '../../core/services/firestore_provider.dart';
import '../../core/database/database_provider.dart';

class CreateShipmentScreen extends StatefulWidget {

  const CreateShipmentScreen({super.key});

  @override
  State<CreateShipmentScreen> createState() =>
      _CreateShipmentScreenState(

      );
}

class _CreateShipmentScreenState

    extends State<CreateShipmentScreen> {

  int currentStep = 0;
  final steps = [

    "Route",
    "Operations",
    "Purchase",
    "Sales",
    "Flight",
    "Notes",
  ];

  @override
  void initState() {
    super.initState();
    _generateCode();
  }

  /// ================= CONTROLLERS =================
  String shipmentCode = '';
  final originCountryController =
  TextEditingController();

  final originCityController =
  TextEditingController();

  final destinationCountryController =
  TextEditingController();

  final destinationCityController =
  TextEditingController();

  final slaughterhouseController =
  TextEditingController();

  final warehouseController =
  TextEditingController();

  final supplierController =
  TextEditingController();

  final buyerController =
  TextEditingController();

  final animalTypeController =
  TextEditingController();

  final quantityController =
  TextEditingController();

  final purchaseWeightController =
  TextEditingController();

  final purchaseCostController =
  TextEditingController();

  final salePriceController =
  TextEditingController();

  final freightForwarderController =
  TextEditingController();

  final airlineController =
  TextEditingController();

  final awbController =
  TextEditingController();

  final flightNumberController =
  TextEditingController();

  final notesController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFFF3F4F6),

      appBar: AppBar(

        backgroundColor: Colors.white,

        title: const Text(
          "Create Shipment",
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            /// HEADER

            Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    const Text(

                      "Create Shipment",

                      style: TextStyle(

                        fontSize: 26,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(

                      "Step ${currentStep + 1} of ${steps.length}",

                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                Container(

                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(

                    color:
                    const Color(0xFF2563EB)
                        .withOpacity(0.1),

                    borderRadius:
                    BorderRadius.circular(30),
                  ),

                  child: Text(

                    steps[currentStep],

                    style: const TextStyle(

                      color: Color(0xFF2563EB),

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            _buildStep(),

            const SizedBox(height: 30),

            /// NAVIGATION

            Row(

              children: [

                /// BACK

                if (currentStep > 0)

                  Expanded(

                    child: OutlinedButton(

                      onPressed: () {

                        setState(() {
                          currentStep--;
                        });
                      },

                      child: const Text("Back"),
                    ),
                  ),

                if (currentStep > 0)
                  const SizedBox(width: 12),

                /// NEXT / CREATE

                Expanded(

                  child: ElevatedButton(

                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      const Color(0xFF2563EB),

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                    ),

                    onPressed: () async {

                      /// NEXT STEP

                      if (currentStep <
                          steps.length - 1) {

                        setState(() {
                          currentStep++;
                        });

                        return;
                      }

                      /// CREATE SHIPMENT

                      if (shipmentCode.isEmpty) return;

                      await firestoreService
                          .createShipment(

                        shipmentCode: shipmentCode,

                        originCountry:
                        originCountryController.text.trim(),

                        originCity:
                        originCityController.text.trim(),

                        destinationCountry:
                        destinationCountryController.text.trim(),

                        destinationCity:
                        destinationCityController.text.trim(),

                        slaughterhouse:
                        slaughterhouseController.text.trim(),

                        destinationWarehouse:
                        warehouseController.text.trim(),

                        supplier:
                        supplierController.text.trim(),

                        buyer:
                        buyerController.text.trim(),

                        animalType:
                        animalTypeController.text.trim(),

                        quantity:
                        double.tryParse(
                          quantityController.text,
                        ) ?? 0,

                        purchaseWeight:
                        double.tryParse(
                          purchaseWeightController.text,
                        ) ?? 0,

                        purchaseCost:
                        double.tryParse(
                          purchaseCostController.text,
                        ) ?? 0,

                        salePrice:
                        double.tryParse(
                          salePriceController.text,
                        ) ?? 0,

                        freightForwarder:
                        freightForwarderController.text.trim(),

                        airline:
                        airlineController.text.trim(),

                        awbNumber:
                        awbController.text.trim(),

                        flightNumber:
                        flightNumberController.text.trim(),

                        notes:
                        notesController.text.trim(),
                      );

                      if (context.mounted) {

                        ScaffoldMessenger.of(context)
                            .showSnackBar(

                          const SnackBar(
                            content: Text(
                              "Shipment created successfully",
                            ),
                          ),
                        );

                        Navigator.pop(context);
                      }
                    },

                    child: Text(

                      currentStep ==
                          steps.length - 1

                          ? "Create Shipment"
                          : "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Future<void> _generateCode() async {

    final snapshot = await firestoreService
        .watchShipments()
        .first;

    final nextNumber =
    (snapshot.length + 1)
        .toString()
        .padLeft(3, '0');

    final now = DateTime.now();

    final day =
    now.day.toString().padLeft(2, '0');

    final month =
    now.month.toString().padLeft(2, '0');

    final code =
        "$day$month-$nextNumber";

    setState(() {
      shipmentCode = code;
    });
  }

  Widget _buildStep() {

    switch (currentStep) {

      case 0:

        return Column(

          children: [

            _field(
              originCountryController,
              "Origin Country",
            ),

            _field(
              originCityController,
              "Origin City",
            ),

            _field(
              destinationCountryController,
              "Destination Country",
            ),

            _field(
              destinationCityController,
              "Destination City",
            ),
          ],
        );

      case 1:

        return Column(

          children: [

            _field(
              slaughterhouseController,
              "Slaughterhouse",
            ),

            _field(
              warehouseController,
              "Destination Warehouse",
            ),
          ],
        );

      case 2:

        return Column(

          children: [

            _field(
              supplierController,
              "Supplier Name",
            ),

            _field(
              animalTypeController,
              "Animal Type",
            ),

            _field(
              quantityController,
              "Quantity",
            ),

            _field(
              purchaseWeightController,
              "Purchase Weight",
            ),

            _field(
              purchaseCostController,
              "Purchase Cost",
            ),
          ],
        );

      case 3:

        return Column(

          children: [

            _field(
              buyerController,
              "Buyer Name",
            ),

            _field(
              salePriceController,
              "Sale Price",
            ),
          ],
        );

      case 4:

        return Column(

          children: [

            _field(
              freightForwarderController,
              "Freight Forwarder",
            ),

            _field(
              airlineController,
              "Airline",
            ),

            _field(
              awbController,
              "AWB Number",
            ),

            _field(
              flightNumberController,
              "Flight Number",
            ),
          ],
        );

      default:

        return Column(

          children: [

            _field(
              notesController,
              "Operational Notes",
              maxLines: 6,
            ),
          ],
        );
    }
  }

  /// ================= HELPERS =================

  Widget _sectionTitle(String title) {

    return Padding(

      padding:
      const EdgeInsets.only(bottom: 14),

      child: Text(

        title,

        style: const TextStyle(

          fontSize: 20,

          fontWeight:
          FontWeight.bold,
        ),
      ),
    );
  }

  Widget _field(
      TextEditingController controller,
      String label, {
        int maxLines = 1,
      }) {

    return Padding(

      padding:
      const EdgeInsets.only(bottom: 14),

      child: TextField(

        controller: controller,

        maxLines: maxLines,

        decoration: InputDecoration(

          labelText: label,

          filled: true,

          fillColor: Colors.white,

          border: OutlineInputBorder(

            borderRadius:
            BorderRadius.circular(16),

            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}