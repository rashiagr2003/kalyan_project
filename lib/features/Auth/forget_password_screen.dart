import 'package:flutter/material.dart';
import 'package:kalyan/features/Auth/otp_verification1_page.dart';

import '../../constants/app_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.accentSeafoam, // Consistent background color
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue, // Matching AppBar color
        title: Text(
          'Forgot Password',
          style: TextStyle(color: AppColors.textWhite), // Consistent text color
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            height: screenHeight * 0.6,
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color:
                  AppColors.textWhite, // Consistent background color for form
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center alignment
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center alignment
                children: [
                  Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.primaryBlue, // Consistent text color
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'No worries, we got you covered.',
                    style: TextStyle(
                      color: AppColors.primaryBlue, // Consistent color
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                      height:
                          screenWidth * 0.08), // Using screen width for spacing
                  // Mobile number input field
                  _buildTextField(_mobileController, 'Enter Mobile Number'),
                  SizedBox(
                      height: screenWidth *
                          0.08), // Adjusted spacing based on screen size
                  SizedBox(
                    width: screenWidth * 0.28,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Implement OTP request logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationCodeScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryBlue, // Consistent button color
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'GET OTP',
                        style: TextStyle(
                          color: AppColors
                              .textWhite, // Consistent button text color
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.04), // Adjusted spacing
                  // Back to login button
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back To Login',
                      style: TextStyle(
                        color: AppColors.primaryBlue, // Consistent text color
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Text field widget with consistent styling
  Widget _buildTextField(TextEditingController controller, String hintText,
      {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade100, // Consistent text field background
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your mobile number';
        }
        return null;
      },
    );
  }
}