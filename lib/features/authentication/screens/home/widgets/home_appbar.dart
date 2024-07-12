import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/home/settings_icon.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../profile/profile.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Row(
        children: [
          GestureDetector(
              onTap: () {
                Get.to(const ProfileScreen());
              },
              child: const TRoundedImage(
                width: 60,
                height: 60,
                imageUrl: 'assets/user/user-image.png',
              ),),
          SizedBox(width: 8.0),
          Column(
            children: [
              Text(
                "welcome back",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.kBlack),
              ),
              SizedBox(height: 6.0),
              Text(
                "Sif Yacine",
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
  }
}
