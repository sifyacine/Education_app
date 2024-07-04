import 'package:education_app/features/authentication/screens/group_chat/widgets/group_pfp.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_bar_container.dart';
import '../../../../common/widgets/images/rounded_images.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../home/widgets/channels.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Chats",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TSearchContainer(text: 'search...'),
            SizedBox(height: TSizes.defaultSpace),
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// heading
                  TSectionHeading(
                    title: 'My groups',
                    textColor: TColors.kBlack,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// groups
                  TGroups(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace , right: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// heading
                  TSectionHeading(
                    title: 'Other groups',
                    textColor: TColors.kBlack,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TRoundedContainer(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace , right: TSizes.defaultSpace),

                    width: double.infinity,
                    showBorder: true,
                    backgroundColor: TColors.primaryColor.withOpacity(0.5),
                    borderColor: TColors.kGrey,
                    margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Heloo'
                          ),
                        ]
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
