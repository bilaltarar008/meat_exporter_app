  import 'package:flutter/material.dart';
  import '../../core/services/firestore_provider.dart';
  import '../../core/database/database_provider.dart';
  import 'package:country_picker/country_picker.dart';


  class CreateShipmentScreen extends StatefulWidget {

    const CreateShipmentScreen({super.key});

    @override
    State<CreateShipmentScreen> createState() =>
        _CreateShipmentScreenState(

        );
  }

  class _CreateShipmentScreenState

      extends State<CreateShipmentScreen> {

    String originCountry = '';
    String originCity = '';

    String destinationCountry = '';
    String destinationCity = '';
    bool isCreatingShipment = false;
    int currentStep = 0;
    final steps = [
      "Route",
      "Operations",
      "Purchase",
      "Flight",
      "Payment",
      "Notes",
    ];

    @override
    void initState() {
      super.initState();
      _generateCode();
    }

    /// ================= CONTROLLERS =================
    String shipmentCode = '';


    final slaughterhouseController =
    TextEditingController();

    final warehouseController =
    TextEditingController();

    final supplierController =
    TextEditingController();

    final animalTypeController =
    TextEditingController();

    final quantityController =
    TextEditingController();

    final purchaseWeightController =
    TextEditingController();

    final purchaseCostController =
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

    final totalPaymentController =
    TextEditingController();

    final advanceReceivedController =
    TextEditingController();

    DateTime? paymentDueDate;

    String paymentStatus = 'Not Started';

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
                          .withValues(alpha: 0.1),

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

                      style: ElevatedButton.styleFrom(

                        backgroundColor:
                        const Color(0xFF2563EB),

                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),

                      onPressed: isCreatingShipment
                          ? null
                          : () async {

                        if (!_validateStep()) return;

                        /// NEXT STEP
                        if (currentStep < steps.length - 1) {

                          setState(() {
                            currentStep++;
                          });

                          return;
                        }

                        /// CREATE SHIPMENT
                        if (shipmentCode.isEmpty) {

                          _showError(
                            "Shipment code not generated yet",
                          );

                          return;
                        }

                        setState(() {
                          isCreatingShipment = true;
                        });

                        try {

                          await firestoreService.createShipment(

                            shipmentCode: shipmentCode,

                            originCountry: originCountry,

                            originCity: originCity,

                            destinationCountry: destinationCountry,

                            destinationCity: destinationCity,

                            slaughterhouse:
                            slaughterhouseController.text.trim(),

                            destinationWarehouse:
                            warehouseController.text.trim(),

                            supplier:
                            supplierController.text.trim(),

                            animalType:
                            animalTypeController.text.trim(),

                            quantity:
                            double.tryParse(
                              quantityController.text,
                            ) ?? 0,

                            salePrice:
                            double.tryParse(
                              totalPaymentController.text,
                            ) ?? 0,

                            paymentDueDate:
                            paymentDueDate,

                            totalPaid:
                            double.tryParse(
                              advanceReceivedController.text,
                            ) ?? 0,

                            outstandingBalance:
                            (
                                (double.tryParse(
                                  totalPaymentController.text,
                                ) ?? 0)

                                    -

                                    (double.tryParse(
                                      advanceReceivedController.text,
                                    ) ?? 0)
                            ),

                            paymentStatus:
                            paymentStatus,

                            purchaseWeight:
                            double.tryParse(
                              purchaseWeightController.text,
                            ) ?? 0,

                            purchaseCost:
                            double.tryParse(
                              purchaseCostController.text,
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

                          if (!mounted) return;

                          if (!context.mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(

                            const SnackBar(

                              backgroundColor: Colors.green,

                              content: Text(
                                "Shipment created successfully",
                              ),
                            ),
                          );

                          Navigator.pop(context);

                        } catch (e) {

                          _showError(
                            "Failed to create shipment: $e",
                          );

                        } finally {

                          if (mounted) {

                            setState(() {
                              isCreatingShipment = false;
                            });
                          }
                        }
                      },

                      child: isCreatingShipment

                          ? const SizedBox(

                        height: 22,
                        width: 22,

                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )

                          : Text(

                        currentStep ==
                            steps.length - 1

                            ? "Create Shipment"
                            : "Next",

                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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

    void _showError(String message) {

      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
        ),
      );
    }

    bool _validateStep() {

      /// STEP 0 — ROUTE
      if (currentStep == 0) {

        if (originCountry.isEmpty ||
            originCity.isEmpty ||
            destinationCountry.isEmpty ||
            destinationCity.isEmpty) {

          _showError(
            "Origin and destination are required",
          );

          return false;
        }
      }

      /// STEP 1 — OPERATIONS
      if (currentStep == 1) {

        if (slaughterhouseController.text.trim().isEmpty ||
            warehouseController.text.trim().isEmpty) {

          _showError(
            "Operations information is required",
          );

          return false;
        }
      }

      /// STEP 2 — PURCHASE
      if (currentStep == 2) {

        if (supplierController.text.trim().isEmpty) {

          _showError(
            "Supplier name is required",
          );

          return false;
        }

        final quantity =
        double.tryParse(
          quantityController.text,
        );

        final weight =
        double.tryParse(
          purchaseWeightController.text,
        );

        final cost =
        double.tryParse(
          purchaseCostController.text,
        );

        if (quantity == null || quantity <= 0) {

          _showError(
            "Enter valid quantity",
          );

          return false;
        }

        if (weight == null || weight <= 0) {

          _showError(
            "Enter valid purchase weight",
          );

          return false;
        }

        if (cost == null || cost <= 0) {

          _showError(
            "Enter valid purchase cost",
          );

          return false;
        }
      }

      /// STEP 3 — FLIGHT
      if (currentStep == 3) {

        if (freightForwarderController.text.trim().isEmpty ||
            airlineController.text.trim().isEmpty ||
            awbController.text.trim().isEmpty ||
            flightNumberController.text.trim().isEmpty) {

          _showError(
            "Flight information is required",
          );

          return false;
        }
      }
      /// STEP 4 — PAYMENT

      if (currentStep == 4) {

        final total =
        double.tryParse(
          totalPaymentController.text,
        );

        final advance =
        double.tryParse(
          advanceReceivedController.text,
        );

        if (total == null || total <= 0) {

          _showError(
            "Enter valid total payment",
          );

          return false;
        }

        if (advance == null || advance < 0) {

          _showError(
            "Enter valid advance payment",
          );

          return false;
        }

        if (paymentDueDate == null) {

          _showError(
            "Select payment due date",
          );

          return false;
        }
      }

      return true;
    }

    Widget _buildStep() {

      switch (currentStep) {

        case 0:

          return Container(

            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(

                  "Shipment Route",

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                /// ORIGIN COUNTRY

                const Text(
                  "Origin Country",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                InkWell(

                  onTap: () {

                    showCountryPicker(

                      context: context,

                      showPhoneCode: false,

                      onSelect: (Country country) {

                        setState(() {
                          originCountry = country.name;
                        });
                      },
                    );
                  },

                  child: _routeSelector(

                    originCountry.isEmpty
                        ? "Select Origin Country"
                        : originCountry,
                  ),
                ),

                const SizedBox(height: 14),

                _field(

                  TextEditingController(text: originCity),

                  "Origin City",

                  onChanged: (value) {
                    originCity = value;
                  },
                ),

                const SizedBox(height: 24),

                /// DESTINATION COUNTRY

                const Text(
                  "Destination Country",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                InkWell(

                  onTap: () {

                    showCountryPicker(

                      context: context,

                      showPhoneCode: false,

                      onSelect: (Country country) {

                        setState(() {
                          destinationCountry = country.name;
                        });
                      },
                    );
                  },

                  child: _routeSelector(

                    destinationCountry.isEmpty
                        ? "Select Destination Country"
                        : destinationCountry,
                  ),
                ),

                const SizedBox(height: 14),

                _field(

                  TextEditingController(text: destinationCity),

                  "Destination City",

                  onChanged: (value) {
                    destinationCity = value;
                  },
                ),
              ],
            ),
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

        case 4:

          return Column(

            children: [

              _field(
                totalPaymentController,
                "Total Payment",
              ),

              const SizedBox(height: 14),

              _field(
                advanceReceivedController,
                "Advance Received",
              ),

              const SizedBox(height: 14),

              InkWell(

                onTap: () async {

                  final picked =
                  await showDatePicker(

                    context: context,

                    initialDate:
                    DateTime.now(),

                    firstDate:
                    DateTime.now(),

                    lastDate:
                    DateTime(2030),
                  );

                  if (picked != null) {

                    setState(() {

                      paymentDueDate =
                          picked;
                    });
                  }
                },

                child: Container(

                  width: double.infinity,

                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(16),

                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),

                  child: Text(

                    paymentDueDate == null

                        ? "Select Payment Due Date"

                        : "${paymentDueDate!.day}/${paymentDueDate!.month}/${paymentDueDate!.year}",
                  ),
                ),
              ),

              const SizedBox(height: 14),

              DropdownButtonFormField<String>(

                value: paymentStatus,

                decoration: InputDecoration(

                  filled: true,

                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(16),

                    borderSide: BorderSide.none,
                  ),
                ),

                items: [

                  'Not Started',
                  'Advance Received',
                  'Partial',
                  'Pending',
                  'Completed',
                  'Overdue',

                ].map((status) {

                  return DropdownMenuItem(

                    value: status,

                    child: Text(status),
                  );

                }).toList(),

                onChanged: (value) {

                  setState(() {

                    paymentStatus =
                    value!;
                  });
                },
              ),
            ],
          );
        case 5:

          return Column(

            children: [

              _field(
                notesController,
                "Operational Notes",
                maxLines: 6,
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


    Widget _field(
        TextEditingController controller,
        String label, {
          int maxLines = 1,
          Function(String)? onChanged,
        }) {

      return Padding(

        padding: const EdgeInsets.only(bottom: 14),

        child: TextField(

          controller: controller,

          maxLines: maxLines,

          onChanged: onChanged,

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

    Widget _routeSelector(String text) {

      return Container(

        width: double.infinity,

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),

        decoration: BoxDecoration(

          color: const Color(0xFFF8FAFC),

          borderRadius: BorderRadius.circular(14),

          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),

        child: Row(

          children: [

            Expanded(

              child: Text(

                text,

                style: TextStyle(

                  fontSize: 15,

                  color: text.contains("Select")
                      ? Colors.grey
                      : Colors.black,
                ),
              ),
            ),

            const Icon(
              Icons.keyboard_arrow_down,
            ),
          ],
        ),
      );
    }
  }