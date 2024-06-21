import 'package:flutter/material.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/socail_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo, title and subtitle
              TLoginHeader(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              TLoginForm(),

              /// Divider
              TFormDivider(dividerText: "Or sign in with",),
              SizedBox(height: TSizes.spaceBtwSections),

              /// footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}