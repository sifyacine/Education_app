import 'package:education_app/features/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_images.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/profile/user_controller.dart';

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

            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      TCircularImage(
                        image: userData['channel_img'] ?? "assets/user/user-image.png",
                        width: 80,
                        height: 80,
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
                TProfileMenu(onPressed: () {}, title: 'likes', value: userData['channel_likes'] ?? ''),

                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                const TSectionHeading(title: "Personal information"),
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
