import 'package:education_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/socail_buttons.dart';
import '../../../../utils/constants/sizes.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// title
              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// form
              const SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// divider
              TFormDivider(dividerText: "or sign up with".toUpperCase()),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// social buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

