
import 'package:education_app/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/constants/sizes.dart';
import '../verify_email.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _channelNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _channelDescriptionController = TextEditingController();
  bool _isTeacher = false;
  bool _termsAccepted = false;
  File? _profileImage;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_termsAccepted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please accept the terms and conditions'),
          ),
        );
        return;
      }
      _formKey.currentState?.save();

      // Collect form data
      final data = {
        'channel_name': _channelNameController.text,
        'channel_email': _emailController.text,
        'channel_phone': _phoneNumberController.text,
        'channel_password': _passwordController.text,
        'channel_desc': _channelDescriptionController.text,
        'channel_teacher': _isTeacher.toString(), // Direct boolean value as string
      };

      // Assuming `_profileImage` is a File object for the profile image
      File? profileImage = _profileImage;

      try {
        var uri = Uri.parse('http://127.0.0.1:8000/authentication/createchannel/');
        var request = http.MultipartRequest('POST', uri);

        // Add text fields
        data.forEach((key, value) {
          request.fields[key] = value;
        });

        // Add profile image if provided
        if (profileImage != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'channel_img',
              profileImage.path,
            ),
          );
        }

        var response = await request.send();

        if (response.statusCode == 201) {
          Get.to(() => VerifyEmailPage());
        } else {
          var responseBody = await response.stream.bytesToString();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to sign up: $responseBody'),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $e'),
          ),
        );
      }
    }
  }

  void _onTermsAccepted(bool accepted) {
    setState(() {
      _termsAccepted = accepted;
    });
  }

  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
  String? _validateChannelDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your channel description';
    }
    return null;
  }
  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                backgroundImage:
                _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null
                    ? Icon(Iconsax.user, size: 50, color: Colors.grey.shade400)
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Iconsax.camera, color: Colors.black),
                  onPressed: _pickProfileImage,
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          TextFormField(
            controller: _channelNameController,
            decoration: const InputDecoration(
              labelText: 'Channel Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a channel name';
              }
              if (value.length < 3) {
                return 'Channel name must be at least 3 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _phoneNumberController,
            decoration: const InputDecoration(
              labelText: "Phone number",
              prefixIcon: Icon(Iconsax.call),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a phone number';
              }
              if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                return 'Phone number must be 10 digits';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon:
                Icon(_isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_isConfirmPasswordVisible,
            decoration: InputDecoration(
              labelText: "Confirm password",
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon:
                Icon(_isConfirmPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                onPressed: _toggleConfirmPasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          /// channel description
          TextFormField(
            controller: _channelDescriptionController,
            maxLines: 2,
            maxLength: 275,
            decoration: const InputDecoration(
              labelText: "Channel description",
              alignLabelWithHint: true,
              prefixIcon: Icon(Iconsax.info_circle),
            ),
            validator: _validateChannelDescription,
          ),
          Row(
            children: [
              Checkbox(
                value: _isTeacher,
                onChanged: (bool? value) {
                  setState(() {
                    _isTeacher = value ?? false;
                  });
                },
              ),
              const Text('Are you a teacher?'),
            ],
          ),
          TermsAndConditions(onTermsAccepted: _onTermsAccepted),          /// signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Sign up"),
            ),
          ),
        ],
      ),
    );
  }
}
