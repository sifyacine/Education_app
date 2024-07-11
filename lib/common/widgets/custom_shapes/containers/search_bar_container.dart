import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    Key? key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    this.controller,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? Colors.transparent : null,
            borderRadius: BorderRadius.circular(TSizes.cardRadiuslg),
            border: showBorder ? Border.all(color: TColors.kGrey) : null,
          ),
          child: Row(
            children: [
              const Icon(
                Iconsax.search_normal,
                color: TColors.kDarkGrey,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: text,
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}