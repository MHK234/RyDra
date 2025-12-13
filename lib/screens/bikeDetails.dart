import 'package:flutter/material.dart';
import 'package:rydra/components/inputfield.dart';
import 'package:rydra/components/topNavBar.dart';
import 'package:rydra/screens/HomeScreen.dart';

class Bikedetails extends StatefulWidget {
  const Bikedetails({super.key});

  @override
  State<Bikedetails> createState() => _BikedetailsState();
}

class _BikedetailsState extends State<Bikedetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bikeModelController = TextEditingController();
  final TextEditingController odometerController = TextEditingController();

  String? selectedCompany;
  String? selectedModel;
  final Map<String, List<String>> bikeData = {
    "Honda": ["CD 70", "Pridor 100", "CG 125", "CB 150"],
    "Yamaha": ["Dhoom 70", "YBR 125", "YBR 125G", "YB 100"],
    "Suzuki": ["GD 110S", "GS 150", "GSX 125"],
    "United": ["US70", "US100", "US125", "US150"],
    "Road Prince": ["RP70", "RP110", "RP125"],
    "Metro": ["MR70", "MR100", "MR125"],
    "Union Star": ["US70"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: Column(
            children: [
              topnavbar(),
              const SizedBox(height: 15),

              InputField(
                hint: "Enter Your Name",
                controller: nameController,
                isNumber: false,
                isPassword: false,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: _dropdown(
                      label: "Select Company",
                      value: selectedCompany,
                      items: bikeData.keys.toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCompany = value;
                          selectedModel = null;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _dropdown(
                      label: "Select Model",
                      value: selectedModel,
                      items: selectedCompany == null
                          ? []
                          : bikeData[selectedCompany]!,
                      onChanged: (value) {
                        setState(() {
                          selectedModel = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              InputField(
                hint: "Enter Bike Model",
                controller: bikeModelController,
                isNumber: true,
                isPassword: false,
              ),
              const SizedBox(height: 20),

              InputField(
                hint: 'Enter Odometer Reading',
                controller: odometerController,
                isNumber: true,
                isPassword: false,
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Homescreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1F3C58),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "CONTINUE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 226, 221, 221),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(label),
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
