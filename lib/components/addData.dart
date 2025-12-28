import 'package:flutter/material.dart';
import 'package:rydra/components/inputfield.dart';

class AddData extends StatelessWidget {
  AddData({super.key});
  final TextEditingController odometerCtrl = TextEditingController();
  final TextEditingController costCtrl = TextEditingController();
  final TextEditingController notesCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              const Text(
                'Add Maintenance Log',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              InputField(
                hint: 'Odometer Reading (KM)',
                controller: odometerCtrl,
                type: TextInputType.number,
              ),

              InputField(
                hint: 'Total Cost',
                controller: costCtrl,
                type: TextInputType.number,
              ),
              InputField(
                hint: 'Notes / Details',
                controller: notesCtrl,
                type: TextInputType.text,
                maxLines: 3,
              ),

              const SizedBox(height: 20),

              /// SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton.icon(
                  label: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2E4E6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // close popup

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data Saved Successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 8),

              /// CANCEL
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
