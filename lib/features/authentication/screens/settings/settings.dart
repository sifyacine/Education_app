
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../profile/profile.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                /// appBar
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),

                /// user profile picture
                TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),

            /// list of settings menu (body)
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// account settings
                  const TSectionHeading(title: 'Account Settings', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  TSettingsMenuTile(icon: Iconsax.safe_home,title: 'My Courses', subtitle: 'see the courses you got', onTab: (){ Get.to(() => Container());},),
                  TSettingsMenuTile(icon: Iconsax.shopping_cart,title: 'Saved', subtitle: 'see the saed videos and posts', onTab: (){ Get.to(() => Container());},),
                  TSettingsMenuTile(icon: Iconsax.notification ,title: 'Notifications', subtitle: 'Set any kind of notification messages', onTab: (){},),
                  TSettingsMenuTile(icon: Iconsax.security_card ,title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts', onTab: (){},),

                  /// app settings
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  const TSectionHeading(title: 'App Settings', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  TSettingsMenuTile(icon: Iconsax.document_upload ,title: 'Language', subtitle: 'Select your favorite language ', onTab: (){},),
                  TSettingsMenuTile(icon: Iconsax.location ,title: 'Dark mode', subtitle: 'change to dark mode ', onTab: (){}, trailing: Switch(value: true, onChanged: (value){},),),
                  /// logout button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: (){},
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
