import 'package:education_app/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';
import '../chat_page.dart';

class TGroups extends StatelessWidget {
  const TGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalTextImage(
              image: "assets/user/user-image.png",
              channelName: "english group",
              textColor: TColors.kBlack,
              onTap: () {
                Get.to(() => ChatScreen());
              },
            );
          }),
    );
  }
}
