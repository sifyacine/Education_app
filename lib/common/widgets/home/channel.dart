import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  const Channel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(800),
                color: TColors.primaryColor),
            child: const Icon(Icons.image),
          ),
          const Text("channel name")
        ],
      ),
    );
  }
}

class ChannelIcon extends StatelessWidget {
  const ChannelIcon({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: TColors.primaryColor),
              child: const Icon(Icons.image),
            ),
          ],
        ),
      ),
    );
  }
}
