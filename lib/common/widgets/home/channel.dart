import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  const Channel({super.key, required this.channelName, required this.onTap});
  final String channelName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
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
            Text(channelName)
          ],
        ),
      ),
    );
  }
}

class ChannelIcon extends StatelessWidget {
  const ChannelIcon({super.key, this.onTap, required this.channelName});
  final void Function()? onTap;
  final String channelName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: TColors.primaryColor),
              child: const Icon(Icons.image),
            ),
            Text(channelName)
          ],
        ),
      ),
    );
  }
}

class ChannelIcon1 extends StatelessWidget {
  const ChannelIcon1({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
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
