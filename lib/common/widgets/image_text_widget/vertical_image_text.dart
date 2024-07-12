import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TVerticalTextImage extends StatelessWidget {
  final String image, channelName;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  const TVerticalTextImage({
    super.key,
    required this.image,
    required this.channelName,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: backgroundColor ??
                    (THelperFunctions.isDarkMode(context)
                        ? TColors.dark
                        : TColors.white),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image(
                    image: AssetImage(image),
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 70,
              child: Center(
                child: Text(
                  channelName,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
