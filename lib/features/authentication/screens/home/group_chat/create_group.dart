import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../controllers/group_chat/group_chat_controller.dart';
import '../../../../../utils/constants/colors.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  TextEditingController groupNameCon = TextEditingController();
  File? _selectedImage;
  final GroupController groupController = Get.put(GroupController());

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
    return Padding(
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
              decoration: const BoxDecoration(
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
                  : const Icon(Iconsax.camera),
            ),
          ),
          const SizedBox(height: 12.0),
          const Text(
            "All Users",
            style: TextStyle(fontSize: 16.0),
          ),
          Obx(() => Column(
            children: groupController.allUsers.map((user) {
              return ListTile(
                title: Text(user['username']),
                trailing: IconButton(
                  icon: const Icon(Iconsax.add),
                  onPressed: () {
                    groupController.addMember(user);
                  },
                ),
              );
            }).toList(),
          )),
          const SizedBox(height: 12.0),
          const Text(
            "Selected Members",
            style: TextStyle(fontSize: 16.0),
          ),
          Obx(() => Column(
            children: groupController.members.map((member) {
              return ListTile(
                title: Text(member['username']),
                trailing: IconButton(
                  icon: const Icon(Iconsax.minus),
                  onPressed: () {
                    groupController.removeMember(member);
                  },
                ),
              );
            }).toList(),
          )),
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
              onPressed: () {
                groupController.createGroup(
                  groupNameCon.text,
                  _selectedImage?.path ?? '',
                  12, // Replace with the signed-in user's ID
                );
              },
              child: const Text(
                "Create",
                style: TextStyle(color: TColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
