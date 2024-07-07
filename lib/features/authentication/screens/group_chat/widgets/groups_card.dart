
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class GroupsCard extends StatelessWidget {
  const GroupsCard({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: TSizes.defaultSpace, right: TSizes.defaultSpace),
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
            height: 120,
            padding: const EdgeInsets.only(
              left: TSizes.defaultSpace,
              right: TSizes.defaultSpace,),
            width: double.infinity,
            showBorder: true,
            backgroundColor: TColors.primaryColor.withOpacity(0.5),
            borderColor: TColors.kGrey,
            margin: const EdgeInsets.only(
              bottom: TSizes.spaceBtwItems,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
                        child:
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),

                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: const Image(
                                image: AssetImage("assets/logo/english.png"),
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "English Group",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text("Group members: 12"),
                          ]),

                    ],
                  ),
                  TextButton(onPressed: () {}, child: const Text("Join the group")),

                ]),
          )
        ],
      ),
    );
  }
}
