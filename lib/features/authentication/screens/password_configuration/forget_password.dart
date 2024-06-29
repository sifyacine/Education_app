import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import 'reset_password.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// headings
              Text(
                "Forget password",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "Don't worry sometimes people can forget too, enter your email and we will allow you creating new password",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// text field
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "E-Mail",
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ResetPassword());
                  },
                  child: const Text("submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
