import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  const Channel(
      {super.key,
      required this.channelName,
      required this.onTap,
      required this.imageName});
  final String channelName;
  final void Function()? onTap;
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Card(
                child: Image.asset(
                  imageName,
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              channelName,
            )
          ],
        ),
      ),
    );
  }
}

class ChannelIcon extends StatelessWidget {
  const ChannelIcon(
      {super.key,
      this.onTap,
      required this.channelName,
      required this.imageName});
  final void Function()? onTap;
  final String channelName;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    imageName,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                )),
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
