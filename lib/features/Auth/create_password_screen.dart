import 'package:flutter/material.dart';
import '../../constants/app_colors.dart'; // Assuming you have a constants file for app colors.

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.accentSeafoam,
      appBar: AppBar(
        title: const Text('Create New Password'),
        backgroundColor: AppColors.primaryBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            height: MediaQuery.of(context).size.height *
                0.4, // Container height based on screen size
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
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Align elements to the center horizontally
              children: [
                Text(
                  'Create a New Password',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16.0),
                // Password input field
                _buildPasswordField(
                  controller: _passwordController,
                  hint: 'Enter Password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                // Confirm Password input field
                _buildPasswordField(
                  controller: _confirmPasswordController,
                  hint: 'Confirm Password',
                  validator: (value) {
                    if (value!.isEmpty || value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                // Change Password button
                SizedBox(
                  width: screenWidth * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Implement password change logic
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
                      'CHANGE PASSWORD',
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

  // A helper method to create password fields with consistent styling
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }
}
