import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../../utils/constants/colors.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  TextEditingController groupNameCon = TextEditingController();

  File? _selectedImage;

  Future<void> _openImagePicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Column(
            children: [
              const Text(
                "Group name",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: groupNameCon,
                decoration: const InputDecoration(
                  hintText: "Type group name here ...",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: TColors.primaryColor),
                  ),
                  border: OutlineInputBorder(),
                  fillColor: TColors.white,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _openImagePicker,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: _selectedImage != null
                      ? ClipOval(
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Icon(Iconsax.camera),
                ),
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0,
                    ),
                    backgroundColor: TColors.primaryColor,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Create",
                    style: TextStyle(color: TColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}