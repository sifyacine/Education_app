import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login_screen.dart';


class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// image
              Image(
                width: THelperFunctions.screenWidth()*0.6,
                image: const AssetImage(
                  "assets/email_verifications/Emails-bro.png",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// title and subtitle
              Text( 'Confirm E-mail ', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text( 'ycn585@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text( "Congratulations! your account awaits: verify your email and start your learning journey", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => SuccessScreen(
                      image: "assets/email_verifications/Verified-bro.png",
                      title: "Your account successfully created",
                      subtitle: "Welcom to your ultimate learning destination. Your account is created.",
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ));
                                    },
                  child: const Text(
                    "continue",
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const VerifyEmailScreen());
                  },
                  child: const Text(
                   "Resend E-Mail",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
