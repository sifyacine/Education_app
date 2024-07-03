import 'package:education_app/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TChannels extends StatelessWidget {
  const TChannels({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalTextImage(image: "assets/user/user-image.png", title: "E-Tech", onTap: (){Get.to(() => Container());}, );
          }),
    );
  }
}

