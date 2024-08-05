import 'package:education_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:education_app/features/authentication/screens/signup/signup.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/profile/user_controller.dart';
import '../../home/home_screen.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({super.key});

  @override
  _TLoginFormState createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;
  bool _obscurePassword = true;
  String? _message;


  Future<Map<String, dynamic>> fetchUserData(String email) async {
    final url = Uri.parse('http://127.0.0.1:8000/authentication/user-profile/'); // Update with your endpoint
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'channel_email': email}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }


  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _message = null;
    });

    final email = _emailController.text;
    final password = _passwordController.text;
    final url = Uri.parse('http://127.0.0.1:8000/authentication/signin/'); // Updated URL
    print('Attempting to sign in with email: $email and password: $password');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'channel_email': email, 'channel_password': password}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        print('Login successful.');
        final userData = await fetchUserData(email);
        final UserController userController = Get.put(UserController());
        userController.setUserData(userData);

        // Save login state and user email
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('userEmail', email);

        Get.offAll(() => HomeScreen()); // Navigate to HomeScreen
      } else if (response.statusCode == 404) {
        setState(() {
          _message = 'Email does not exist';
        });
        print('Error: Email does not exist');
      } else if (response.statusCode == 400) {
        setState(() {
          _message = 'Incorrect password';
        });
        print('Error: Incorrect password');
      } else if (response.statusCode == 403) {
        setState(() {
          _message = 'Email not verified';
        });
        print('Error: Email not verified');
        Get.toNamed('/verify');
      } else {
        setState(() {
          _message = responseData['error'] ?? 'Unknown error occurred';
        });
        print('Error: ${_message}');
      }
    } catch (error) {
      setState(() {
        _message = 'An error occurred. Please try again.';
      });
      print('Exception: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "E-mail",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.eye_slash),
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),

            /// remember me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// remember me
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text("Remember me"),
                  ],
                ),

                /// forget password
                TextButton(
                  onPressed: () {
                    Get.to(() => ForgotPasswordPage());
                  },
                  child: const Text(
                    "Forget password?",
                    style: TextStyle(color: TColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(width: TSizes.spaceBtwSections),

            Column(
              children: [
                /// Sign in button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signIn,
                    child: _isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text("Sign in"),
                  ),
                ),
                if (_message != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    _message!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
                const SizedBox(height: TSizes.spaceBtwItems),

                /// create account button
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0), // Add space here
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text(
                        "Create account",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}