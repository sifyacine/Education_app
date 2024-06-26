import 'package:education_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:education_app/features/authentication/screens/signup/signup.dart';
import 'package:education_app/navigation_menu.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "E-mail",
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.eye_slash),
                labelText: "Password",
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),

            /// remember me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text("Remember me"),
                  ],
                ),

                /// forget password
                TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  child: const Text("Forget password?", style: TextStyle(color: TColors.primaryColor),),
                )
              ],
            ),
            const SizedBox(width: TSizes.spaceBtwSections),

            Column(
              children: [
                /// Sign in button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const NavigationMenu());
                    },
                    child: const Text(
                      "Sign in",
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// create account button
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0), // Add space here
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(() => const SignUpScreen());
                      },
                      child: const Text(
                        "Create account",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
