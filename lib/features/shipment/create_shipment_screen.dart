  import 'package:flutter/material.dart';
  import 'package:country_picker/country_picker.dart';

  import '../../core/services/firestore_provider.dart';
  import '../master_data/services/country_city_service.dart';

  import '../master_data/services/master_data_service.dart';
  import '../master_data/models/supplier_model.dart';
  import '../master_data/models/slaughterhouse_model.dart';

  class CreateShipmentScreen extends StatefulWidget {
    const CreateShipmentScreen({super.key});

    @override
    State<CreateShipmentScreen> createState() =>
        _CreateShipmentScreenState();
  }

  class _CreateShipmentScreenState
      extends State<CreateShipmentScreen> {

    /// ================= ROUTE =================

    String originCountry = '';
    String destinationCountry = '';

    String originCity = '';
    String destinationCity = '';

    String? selectedOriginCity;
    String? selectedDestinationCity;

    List<String> originCities = [];
    List<String> destinationCities = [];


    /// ================= STATE =================

    bool isCreatingShipment = false;

    int currentStep = 0;

    String shipmentCode = '';

    final steps = [
      "Route",
      "Operations",
      "Purchase",
      "Flight",
      "Payment",
      "Notes",
    ];

    final countryCityService = CountryCityService();

    /// ================= DROPDOWN =================

    SupplierModel? selectedSupplier;

    SlaughterhouseModel? selectedSlaughterhouse;

    /// ================= CONTROLLERS =================

    final warehouseController =
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

    @override
    void initState() {
      super.initState();

      _generateCode();
    }

    @override
    Widget build(BuildContext context) {

      return Scaffold(

        backgroundColor:
        const Color(0xFFF3F4F6),

        appBar: AppBar(

          backgroundColor: Colors.white,

          elevation: 0,

          title: const Text(
            "Create Shipment",
          ),
        ),

        body: SingleChildScrollView(

          padding:
          const EdgeInsets.all(16),

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
                          fontSize: 28,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(

                        "Step ${currentStep + 1} of ${steps.length}",

                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  Container(

                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
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

                        color:
                        Color(0xFF2563EB),

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

              /// BUTTONS

              Row(

                children: [

                  if (currentStep > 0)

                    Expanded(

                      child: OutlinedButton(

                        onPressed: () {

                          setState(() {
                            currentStep--;
                          });
                        },

                        child:
                        const Text("Back"),
                      ),
                    ),

                  if (currentStep > 0)
                    const SizedBox(width: 12),

                  Expanded(

                    child: ElevatedButton(

                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        const Color(
                            0xFF2563EB),

                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 16,
                        ),

                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              14),
                        ),
                      ),

                      onPressed:
                      isCreatingShipment
                          ? null
                          : () async {

                        if (!_validateStep()) {
                          return;
                        }

                        if (currentStep <
                            steps.length - 1) {

                          setState(() {
                            currentStep++;
                          });

                          return;
                        }

                        await _createShipment();
                      },

                      child:
                      isCreatingShipment

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

                          : Text(

                        currentStep ==
                            steps.length - 1
                            ? "Create Shipment"
                            : "Next",

                        style:
                        const TextStyle(

                          color:
                          Colors.white,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      );
    }

    /// =========================================================

    Widget _buildStep() {

      switch (currentStep) {

      /// =====================================================
      /// ROUTE
      /// =====================================================

        case 0:

          return Container(

            padding:
            const EdgeInsets.all(18),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius:
              BorderRadius.circular(20),
            ),

            child: Column(

              children: [

                /// ORIGIN COUNTRY

                InkWell(

                  onTap: () {

                    showCountryPicker(

                      context: context,

                      showPhoneCode: false,

                      onSelect: (country) async {

                        originCountry =
                            country.name;

                        selectedOriginCity =
                        null;

                        originCity = '';

                        await _loadOriginCities();

                        setState(() {});
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

                /// ORIGIN CITY

      /// ORIGIN CITY

      DropdownButtonFormField<String>(

      initialValue: selectedOriginCity,

      decoration: _dropdownDecoration(
      "Origin City",
      ),

      hint: const Text(
      "Select Origin City",
      ),

      items: [

      ...originCities.map((city) {

      return DropdownMenuItem<String>(

      value: city,

      child: Text(city),
      );

      }),
      ],

      onChanged: originCountry.isEmpty

      ? null

          : (value) {

      setState(() {

      selectedOriginCity = value;

      originCity = value ?? '';
      });
      },
      ),

      Align(

      alignment: Alignment.centerRight,

      child: TextButton.icon(

      onPressed: () async {

      if (originCountry.isEmpty) {

      _showError(
      "Select country first",
      );

      return;
      }

      await _addCity(
      isOrigin: true,
      );
      },

      icon: const Icon(Icons.add),

      label: const Text(
      "Add New City",
      ),
      ),
      ),

                const SizedBox(height: 24),

                /// DESTINATION COUNTRY

                InkWell(

                  onTap: () {

                    showCountryPicker(

                      context: context,

                      showPhoneCode: false,

                      onSelect: (country) async {

                        destinationCountry =
                            country.name;

                        selectedDestinationCity =
                        null;

                        destinationCity = '';

                        await _loadDestinationCities();

                        setState(() {});
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

                /// DESTINATION CITY

                /// DESTINATION CITY

                DropdownButtonFormField<String>(

                  initialValue: selectedDestinationCity,

                  decoration: _dropdownDecoration(
                    "Destination City",
                  ),

                  hint: const Text(
                    "Select Destination City",
                  ),

                  items: [

                    ...destinationCities.map((city) {

                      return DropdownMenuItem<String>(

                        value: city,

                        child: Text(city),
                      );

                    }),
                  ],

                  onChanged: destinationCountry.isEmpty

                      ? null

                      : (value) {

                    setState(() {

                      selectedDestinationCity = value;

                      destinationCity = value ?? '';
                    });
                  },
                ),

                Align(

                  alignment: Alignment.centerRight,

                  child: TextButton.icon(

                    onPressed: () async {

                      if (destinationCountry.isEmpty) {

                        _showError(
                          "Select country first",
                        );

                        return;
                      }

                      await _addCity(
                        isOrigin: false,
                      );
                    },

                    icon: const Icon(Icons.add),

                    label: const Text(
                      "Add New City",
                    ),
                  ),
                ),
              ],
            ),
          );

      /// =====================================================
      /// OPERATIONS
      /// =====================================================

        case 1:

          return Column(

            children: [

              StreamBuilder<
                  List<SlaughterhouseModel>>(

                stream:
                masterDataService
                    .watchSlaughterhouses(),

                builder:
                    (context, snapshot) {

                  final slaughterhouses =
                      snapshot.data ?? [];

                  return Column(

                    children: [

                      DropdownButtonFormField<String>(

                        initialValue: selectedSlaughterhouse?.name,

                        decoration:
                        _dropdownDecoration(
                            "Slaughterhouse"),

                        items:
                        slaughterhouses
                            .map((item) {

                          return DropdownMenuItem(

                            value: item.name,

                            child:
                            Text(item.name),
                          );

                        }).toList(),

                        onChanged: (value) {

                          final selected =
                          slaughterhouses
                              .firstWhere(
                                (e) =>
                            e.name ==
                                value,
                          );

                          setState(() {

                            selectedSlaughterhouse =
                                selected;
                          });
                        },
                      ),

                      Align(

                        alignment:
                        Alignment.centerRight,

                        child:
                        TextButton.icon(

                          onPressed:
                          _showAddSlaughterhouseDialog,

                          icon:
                          const Icon(Icons.add),

                          label:
                          const Text(
                            "Add Slaughterhouse",
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              _field(
                warehouseController,
                "Destination Warehouse",
              ),
            ],
          );

      /// =====================================================
      /// PURCHASE
      /// =====================================================

        case 2:

          return Column(

            children: [

              StreamBuilder<List<SupplierModel>>(

                stream:
                masterDataService
                    .watchSuppliers(),

                builder:
                    (context, snapshot) {

                  final suppliers =
                      snapshot.data ?? [];

                  return Column(

                    children: [

                      DropdownButtonFormField<String>(

                        initialValue: selectedSupplier?.name,

                        decoration:
                        _dropdownDecoration(
                            "Supplier"),

                        items:
                        suppliers.map((item) {

                          return DropdownMenuItem(

                            value: item.name,

                            child:
                            Text(item.name),
                          );

                        }).toList(),

                        onChanged: (value) {

                          final selected =
                          suppliers.firstWhere(
                                (e) =>
                            e.name ==
                                value,
                          );

                          setState(() {

                            selectedSupplier =
                                selected;
                          });
                        },
                      ),

                      Align(

                        alignment:
                        Alignment.centerRight,

                        child:
                        TextButton.icon(

                          onPressed:
                          _showAddSupplierDialog,

                          icon:
                          const Icon(Icons.add),

                          label:
                          const Text(
                            "Add Supplier",
                          ),
                        ),
                      ),
                    ],
                  );
                },
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

      /// =====================================================
      /// FLIGHT
      /// =====================================================

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

      /// =====================================================
      /// PAYMENT
      /// =====================================================

        case 4:

          return Column(

            children: [

              _field(
                totalPaymentController,
                "Total Payment",
              ),
            ],
          );
      /// =====================================================
      /// NOTES
      /// =====================================================

        default:

          return _field(
            notesController,
            "Operational Notes",
            maxLines: 6,
          );
      }
    }

    /// =========================================================

    InputDecoration _dropdownDecoration(
        String label) {

      return InputDecoration(

        labelText: label,

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(16),

          borderSide: BorderSide.none,
        ),
      );
    }

    /// =========================================================

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

    /// =========================================================

    Widget _routeSelector(String text) {

      return Container(

        width: double.infinity,

        padding:
        const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),

        decoration: BoxDecoration(

          color:
          const Color(0xFFF8FAFC),

          borderRadius:
          BorderRadius.circular(14),

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

                  color:
                  text.contains("Select")

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

    /// =========================================================

    Future<void> _loadOriginCities() async {

      countryCityService
          .watchCities(originCountry)
          .listen((cities) {

        setState(() {

          originCities = cities;
        });
      });
    }

    Future<void> _loadDestinationCities() async {

      countryCityService
          .watchCities(destinationCountry)
          .listen((cities) {

        setState(() {

          destinationCities = cities;
        });
      });
    }

    /// =========================================================

    Future<void> _addCity({
      required bool isOrigin,
    }) async {

      final controller =
      TextEditingController();

      final city =
      await showDialog<String>(

        context: context,

        builder: (_) {

          return AlertDialog(

            title: const Text(
              "Add City",
            ),

            content: TextField(

              controller: controller,

              decoration:
              const InputDecoration(
                hintText:
                "Enter city name",
              ),
            ),

            actions: [

              TextButton(

                onPressed: () {
                  Navigator.pop(context);
                },

                child:
                const Text("Cancel"),
              ),

              ElevatedButton(

                onPressed: () {

                  Navigator.pop(
                    context,
                    controller.text.trim(),
                  );
                },

                child:
                const Text("Add"),
              ),
            ],
          );
        },
      );

      if (city == null ||
          city.isEmpty) {
        return;
      }

      final country = isOrigin
          ? originCountry
          : destinationCountry;

      await countryCityService.addCity(

        country: country,

        city: city,
      );

      if (isOrigin) {

        selectedOriginCity = city;

        originCity = city;

        await _loadOriginCities();

      } else {

        selectedDestinationCity =
            city;

        destinationCity = city;

        await _loadDestinationCities();
      }

      setState(() {});
    }

    /// =========================================================

    Future<void> _showAddSupplierDialog() async {

      final controller =
      TextEditingController();

      await showDialog(

        context: context,

        builder: (_) {

          return AlertDialog(

            title:
            const Text("Add Supplier"),

            content: TextField(

              controller: controller,

              decoration:
              const InputDecoration(
                hintText:
                "Supplier Name",
              ),
            ),

            actions: [

              TextButton(

                onPressed: () {
                  Navigator.pop(context);
                },

                child:
                const Text("Cancel"),
              ),

              ElevatedButton(

                onPressed: () async {

                  if (controller.text
                      .trim()
                      .isEmpty) {
                    return;
                  }

                  await masterDataService
                      .addSupplier(
                    controller.text.trim(),
                  );

                  if (!mounted) return;

                  Navigator.pop(context);
                },

                child:
                const Text("Save"),
              ),
            ],
          );
        },
      );
    }

    /// =========================================================

    Future<void>
    _showAddSlaughterhouseDialog() async {

      final controller =
      TextEditingController();

      await showDialog(

        context: context,

        builder: (_) {

          return AlertDialog(

            title: const Text(
              "Add Slaughterhouse",
            ),

            content: TextField(

              controller: controller,

              decoration:
              const InputDecoration(
                hintText:
                "Slaughterhouse Name",
              ),
            ),

            actions: [

              TextButton(

                onPressed: () {
                  Navigator.pop(context);
                },

                child:
                const Text("Cancel"),
              ),

              ElevatedButton(

                onPressed: () async {

                  if (controller.text
                      .trim()
                      .isEmpty) {
                    return;
                  }

                  await masterDataService
                      .addSlaughterhouse(
                    controller.text.trim(),
                  );

                  if (!mounted) return;

                  Navigator.pop(context);
                },

                child:
                const Text("Save"),
              ),
            ],
          );
        },
      );
    }

    /// =========================================================

    Future<void> _generateCode() async {

      final snapshot =
      await firestoreService
          .watchShipments()
          .first;

      final nextNumber =
      (snapshot.length + 1)
          .toString()
          .padLeft(3, '0');

      final now = DateTime.now();

      final code =
          "${now.day.toString().padLeft(2, '0')}"
          "${now.month.toString().padLeft(2, '0')}"
          "-$nextNumber";

      setState(() {
        shipmentCode = code;
      });
    }

    /// =========================================================

    Future<void> _createShipment() async {

      if (shipmentCode.isEmpty) {

        _showError(
          "Shipment code missing",
        );

        return;
      }

      setState(() {
        isCreatingShipment = true;
      });

      try {

        await firestoreService.createShipment(

          shipmentCode: shipmentCode,

          totalPayment:
          double.tryParse(
            totalPaymentController.text,
          ) ?? 0,

          /// ROUTE
          originCountry: originCountry,
          originCity: originCity,

          destinationCountry: destinationCountry,
          destinationCity: destinationCity,

          /// OPERATIONS
          slaughterhouse:
          selectedSlaughterhouse!.name,

          destinationWarehouse:
          warehouseController.text.trim(),

          /// PURCHASE
          supplier:
          selectedSupplier!.name,

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

          /// FLIGHT
          freightForwarder:
          freightForwarderController.text.trim(),

          airline:
          airlineController.text.trim(),

          awbNumber:
          awbController.text.trim(),

          flightNumber:
          flightNumberController.text.trim(),

          /// NOTES
          notes:
          notesController.text.trim(),
        );

        if (!mounted) return;

        ScaffoldMessenger.of(context)
            .showSnackBar(

          const SnackBar(

            backgroundColor:
            Colors.green,

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
            isCreatingShipment =
            false;
          });
        }
      }
    }

    /// =========================================================

    bool _validateStep() {

      if (currentStep == 0) {

        if (originCountry.isEmpty ||
            originCity.isEmpty ||
            destinationCountry.isEmpty ||
            destinationCity.isEmpty) {

          _showError(
            "Select route details",
          );

          return false;
        }
      }

      if (currentStep == 1) {

        if (selectedSlaughterhouse ==
            null) {

          _showError(
            "Select slaughterhouse",
          );

          return false;
        }
      }

      if (currentStep == 2) {

        if (selectedSupplier ==
            null) {

          _showError(
            "Select supplier",
          );

          return false;
        }
      }

      return true;
    }

    /// =========================================================

    void _showError(String message) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(

          backgroundColor:
          Colors.red,

          content: Text(message),
        ),
      );
    }
  }