import 'package:flutter/material.dart';
import 'package:rydra/components/inputfield.dart';
import 'package:rydra/components/topNavBar.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final emailController = TextEditingController(text: 'hk7265234@gmail.com');
    final contentController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: SafeArea(
        child: Column(
          children: [
            topnavbar(),

            /// Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    /// Title
                    const Text(
                      'HELP AND SUPPORT',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1F3C58),
                        fontFamily: 'Sigmar',
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Description
                    const Text(
                      'If you are experiencing any issue, Please let us know. '
                      'Feel free to contact us',
                      style: TextStyle(fontSize: 13, height: 1.6),
                    ),

                    const SizedBox(height: 24),

                    /// Title Field
                    InputField(
                      hint: 'Enter Title',
                      controller: titleController,
                      type: TextInputType.text,
                    ),

                    const SizedBox(height: 16),

                    /// Email Field
                    InputField(
                      hint: 'Email',
                      controller: emailController,
                      type: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 16),

                    /// Explanation Field
                    InputField(
                      hint: 'Explanation',
                      maxLines: 6,
                      controller: contentController,
                      type: TextInputType.text,
                    ),

                    const SizedBox(height: 40),

                    /// Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: submit logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2E4E6F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// Contact Info
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'Please Contact Us on',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Phone: +92 331 2448956',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
