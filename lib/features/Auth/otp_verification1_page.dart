import 'package:flutter/material.dart';
import 'package:kalyan/features/Auth/create_password_screen.dart';
import '../../constants/app_colors.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  // Create a list to hold the controllers and focus nodes for each OTP digit field
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen width and height for responsiveness
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.accentSeafoam,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: const Text(
          'Verification Code',
          style: TextStyle(color: AppColors.textWhite),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: width * 0.8, // Responsive width based on screen size
            height: height * 0.5, // Set a fixed height
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center alignment
              crossAxisAlignment: CrossAxisAlignment.center, // Center alignment
              children: [
                Text(
                  'Verification Code',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'We have sent the verification code to your mobile number.',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                // OTP input fields with responsive layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02), // Responsive horizontal spacing
                      child: _buildOtpTextField(index),
                    );
                  }),
                ),
                const SizedBox(height: 24.0),
                // Resend OTP button with responsive size
                SizedBox(
                  width: width * 0.6, // Responsive width
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement resend OTP logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'RESEND OTP',
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build the OTP text field widget
  Widget _buildOtpTextField(int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          autofocus: index == 0, // Focus on the first TextField
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: '', // Hide counter text (i.e., '1/1')
            border: InputBorder.none,
          ),
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
          onChanged: (value) {
            // Automatically move to the next field
            if (value.isNotEmpty) {
              if (index < 3) {
                // Move focus to next text field
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else {
                // Once the last field is filled, verify OTP and navigate
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePasswordScreen()));
              }
            }
          },
        ),
      ),
    );
  }
}
