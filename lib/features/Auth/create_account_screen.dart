import 'package:flutter/material.dart';
import 'package:kalyan/features/Auth/login_page.dart';

import '../../constants/app_colors.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.accentSeafoam, // Updated background color
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
        child: Center(
          child: Container(
            height: screenHeight * 0.6,
            padding: EdgeInsets.all(screenWidth * 0.06), // Responsive padding
            decoration: BoxDecoration(
              color: AppColors.textWhite, // Updated to use AppColors
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Vertically center the form
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Align form items to the start
                children: [
                  Text(
                    'Let\'s Create Your Account',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.primaryBlue, // Updated text color
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),
                  _buildTextField(_nameController, 'Enter Your Name'),
                  _buildTextField(_mobileController, 'Enter Mobile Number'),
                  _buildTextField(
                    _passwordController,
                    'Enter Password',
                    obscureText: true,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        activeColor:
                            AppColors.primaryBlue, // Updated active color
                        checkColor: AppColors.textWhite,
                      ),
                      Expanded(
                        child: Text(
                          'I accept the Privacy Policy and Terms & Conditions',
                          style: TextStyle(
                            color: AppColors.primaryBlue, // Updated text color
                            fontSize:
                                screenWidth * 0.04, // Responsive text size
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.06), // Responsive height

                  // Sign up button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Implement sign-up logic here
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primaryBlue, // Updated button color
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      '  SIGN UP  ',
                      style: TextStyle(
                        color: AppColors.textWhite, // Updated text color
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.03), // Responsive height
                  TextButton(
                    onPressed: () {
                      // Implement login logic here
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (_) =>
                                const LoginScreen()), // Replace with your actual screen
                      );
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: AppColors.primaryBlue, // Updated text color
                        fontSize: screenWidth * 0.035, // Responsive text size
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

  Widget _buildTextField(TextEditingController controller, String hintText,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), // Provide space between fields
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $hintText';
          }
          return null;
        },
      ),
    );
  }
}
