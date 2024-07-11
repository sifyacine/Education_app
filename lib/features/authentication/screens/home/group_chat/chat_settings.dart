import 'dart:io';
import 'package:education_app/features/authentication/screens/home/group_chat/widgets/shared_images_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import 'invite_link_page.dart';
import 'members_page.dart';

class ChatSettingsPage extends StatefulWidget {
  const ChatSettingsPage({Key? key}) : super(key: key);

  @override
  State<ChatSettingsPage> createState() => _ChatSettingsPageState();
}

class _ChatSettingsPageState extends State<ChatSettingsPage> {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: TPrimaryHeaderContainer(
                child: Center( // Center the column
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Group Name",
                        style: TextStyle(fontSize: 16.0),
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
                              width: 70,
                              height: 70,
                            ),
                          )
                              : CircleAvatar(
                            backgroundImage: AssetImage('assets/user/profile_pic.avif'), // Replace with the actual image path or network image
                            radius: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(
                    title: 'Group Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.user,
                    title: 'Group Members',
                    subtitle: '12 members',
                    onTab: () {
                      Get.to(() => MembersPage()); // Replace with actual destination
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems/3),
                  TSettingsMenuTile(
                    icon: Iconsax.gallery,
                    title: 'shared images',
                    subtitle: 'shared images and files',
                    onTab: () {
                      Get.to(() => SharedImagesPage()); // Replace with actual destination
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems/3),
                  TSettingsMenuTile(
                    icon: Iconsax.link,
                    title: 'invite link',
                    subtitle: 'invite your friends',
                    onTab: () {
                      Get.to(() => InviteLinkPage()); // Replace with actual destination
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems/3),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subtitle: 'mute notifications',
                    onTab: () {
                      Get.to(() => Container()); // Replace with actual destination
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Leave the Group'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
