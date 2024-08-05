import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/home/settings_icon.dart';
import '../../../../../common/widgets/images/circular_images.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/profile/user_controller.dart';
import '../../profile/profile.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Obx(() {
      final userData = userController.userData;
      final profileImageUrl = userData['channel_img'] != null
          ? "http://127.0.0.1:8000${userData['channel_img']}"
          : "assets/user/user-image.png";

      return TAppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const ProfileScreen());
              },
              child: TCircularImage(
                image: profileImageUrl,
                width: 60,
                height: 60,
                isNetworkImage: userData['channel_img'] != null,
              ),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.kBlack),
                ),
                SizedBox(height: 6.0),
                Text(
                  userData['channel_name'] ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TSettingsIcon(
            iconColor: TColors.white,
            onPressed: () {},
          ),
        ],
      );
    });
  }
}
