import 'package:flutter/material.dart';
import 'package:kalyan/features/Auth/forget_password_screen.dart';

import '../../constants/app_colors.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive design
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.accentSeafoam, // Consistent background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Center(
          child: Container(
            height: screenHeight * 0.6,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: AppColors.textWhite, // Consistent text field background
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Heading
                  Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  // Mobile number field
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: _buildTextField(
                        _mobileController, 'Enter Mobile Number'),
                  ),

                  // Password field
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: _buildTextField(
                      _passwordController,
                      'Enter Password',
                      obscureText: true,
                    ),
                  ),

                  // Forgot password link
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen()),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  // Login Button
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Implement login logic here
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // OR text
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: AppColors.primaryBlue.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Create account link
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (_) => const CreateAccountScreen()),
                          );
                        },
                        child: const Text(
                          'CREATE AN ACCOUNT',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
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
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
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
    );
  }
}
