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
      appBar: const TAppBar(
        title: Text(
          "Chats",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TSearchContainer(text: 'search...'),
            const SizedBox(height: TSizes.defaultSpace),
            const Padding(
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
              padding: const EdgeInsets.only(left: TSizes.defaultSpace , right: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// heading
                  const TSectionHeading(
                    title: 'Other groups',
                    textColor: TColors.kBlack,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TRoundedContainer(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace , right: TSizes.defaultSpace),

                    width: double.infinity,
                    showBorder: true,
                    backgroundColor: TColors.primaryColor.withOpacity(0.5),
                    borderColor: TColors.kGrey,
                    margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                    child: const Column(
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
