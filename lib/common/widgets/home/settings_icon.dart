import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/authentication/screens/settings/settings.dart';


class TSettingsIcon extends StatelessWidget {
  const TSettingsIcon({
  super.key, required this.onPressed, this.iconColor,
  });
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){Get.to(const SettingsPage());}, icon: const Icon(Iconsax.setting), color: iconColor,);
  }
}

