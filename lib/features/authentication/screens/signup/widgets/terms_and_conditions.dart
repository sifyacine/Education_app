import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'I agree to ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'Privacy and policy ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: isDark ? TColors.white : TColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark ? TColors.white : TColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: 'and ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'terms of use ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: isDark ? TColors.white : TColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark ? TColors.white : TColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}