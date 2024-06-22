import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login_screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                width: THelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(
                  "assets/forget_password/Email campaign-rafiki.png",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// title and subtitle
              Text(
                "password reset email sent",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                "Your account is our priority! we've sent you secure link to your email",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Get.to(() => SuccessScreen(
                      image: "assets/email_verifications/Verified-bro.png",
                      title: "You have reset your password",
                      subtitle: "You have created new password go and start your learning journey",
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ));
                  },
                  child: const Text(
                    "Done",
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){},
                  child: const Text(
                    "Resend E-Mail",
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
