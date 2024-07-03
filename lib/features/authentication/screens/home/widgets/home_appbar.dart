import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/home/settings_icon.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';


class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(title: Row(
      children: [
        const TRoundedImage(imageUrl: 'assets/user/user-image.png',),
        Column(
          children: [
            Text("welcome back", style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.kGrey),),
            Text("Sif Yacine", style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
          ],
        ),
      ],
    ),
      actions: [
        TSettingsIcon(iconColor: TColors.white, onPressed: (){},),

      ],
    );
  }
}