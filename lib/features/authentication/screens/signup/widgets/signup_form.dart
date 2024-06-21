
import 'package:education_app/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../verify_email.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
  super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// first and last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: "First name",
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: "Last name",
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// user name
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: "User Name",
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          /// email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: "E-Mail",
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// phone number
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Phone number",
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// terms and conditions checkbox
          const TermsAndConditions(),

          /// signup button
          const SizedBox(height: TSizes.spaceBtwSections),
          // Add space here
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const VerifyEmailScreen());
              },
              child: const Text(
                "Sign up"
              ),
            ),
          ),
        ],
      ),
    );
  }
}

