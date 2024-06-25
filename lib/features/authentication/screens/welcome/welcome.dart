import 'package:education_app/common/widgets/login_signup/form_divider.dart';
import 'package:education_app/features/authentication/controllers/welcome/welcome_controller.dart';
import 'package:education_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    WelcomeControllerImp welcomeControllerImp = Get.put(WelcomeControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/logo/logo-no-background.png",
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 60,
                            ),
                          ],
                        ),
                        Text(
                          "Professor",
                          style: TextStyle(fontSize: 18),
                        ),
                        Checkbox(
                          value: false,
                          onChanged: (val) {},
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20),
                      child: Text("----choose----"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.group,
                              size: 60,
                            ),
                          ],
                        ),
                        const Text(
                          "Student",
                          style: TextStyle(fontSize: 18),
                        ),
                        Checkbox(
                          value: true,
                          onChanged: (val) {},
                          activeColor: TColors.primaryColor,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const TFormDivider(dividerText: "Description"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: "D-escription",
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo,
                    size: 70,
                  ),
                  Text(
                    "Add Photo",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
