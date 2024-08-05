import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_images.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/profile/user_controller.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(() {
            final userData = userController.userData;

            final imageUrl = userData['channel_img'] != null
                ? "http://127.0.0.1:8000${userData['channel_img']}"
                : "assets/user/user-image.png";

            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      TCircularImage(
                        image: imageUrl,
                        width: 80,
                        height: 80,
                        isNetworkImage: userData['channel_img'] != null,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Change your profile picture'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                const TSectionHeading(title: "Profile Information"),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(onPressed: () {}, title: 'Name', value: userData['channel_name'] ?? ''),
                TProfileMenu(onPressed: () {}, title: 'Likes', value: userData['channel_likes'] ?? ''),

                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                const TSectionHeading(title: "Personal Information"),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(icon: Iconsax.copy, title: 'User-ID', value: userData['id']?.toString() ?? ''),
                TProfileMenu(onPressed: () {}, title: 'E-mail', value: userData['channel_email'] ?? ''),
                TProfileMenu(onPressed: () {}, title: 'Phone Number', value: userData['channel_phone'] ?? ''),

                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Close Account', style: TextStyle(color: Colors.redAccent)),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
