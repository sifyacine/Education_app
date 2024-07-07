import 'package:education_app/features/authentication/screens/group_chat/widgets/group_pfp.dart';
import 'package:education_app/features/authentication/screens/group_chat/widgets/groups_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_bar_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'create_group.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => CreateGroupScreen(),
          );
        },
        child: Icon(Iconsax.add, color: TColors.white),
        elevation: 0,
        backgroundColor: TColors.primaryColor,
      ),
      appBar: const TAppBar(
        title: Text(
          "Chats",
        ),
      ),
      body: const SingleChildScrollView(
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
            GroupsCard(),
          ],
        ),
      ),
    );
  }
}
