import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
class TFormDivider extends StatelessWidget {
  final String dividerText;

  const TFormDivider({
    Key? key,
    required this.dividerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Divider(color:  TColors.kDarkGrey , thickness: 0.6, indent: 5, endIndent: 20,)),
        Text(dividerText.toUpperCase(), style: Theme.of(context).textTheme.labelMedium,),
        const Flexible(child: Divider(color: TColors.kDarkGrey , thickness: 0.6, indent: 20, endIndent: 5,)),
      ],
    );
  }
}
