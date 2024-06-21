import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
  super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 150,
          image: AssetImage(
            "assets/logo/logo-no-background.png"
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Text(
          "Welcome back",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          "Discover Limitless Choices and build knowledge.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}