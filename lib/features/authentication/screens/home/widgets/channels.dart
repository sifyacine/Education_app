import 'package:education_app/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TChannels extends StatelessWidget {
  const TChannels({
    required this.imageName,
    required this.channelName,
    required this.onTapChannel,
    super.key,
  });
  final String imageName;
  final String channelName;
  final void Function()? onTapChannel;
  @override
  Widget build(BuildContext context) {
    return TVerticalTextImage(
      image: imageName,
      channelName: channelName,
      onTap: onTapChannel,
    );
  }
}
