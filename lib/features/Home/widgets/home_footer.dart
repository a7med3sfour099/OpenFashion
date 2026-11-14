import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:openfashion/widgets/custom_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Ionicons.logoTwitter, color: Colors.white, size: 30),
            Icon(Ionicons.logoInstagram, color: Colors.white, size: 30),

            Icon(Ionicons.logoFacebook, color: Colors.white, size: 30),
          ],
        ),
        Gap(25),
        Image.asset('assets/svgs/line.png', width: 125),
        Gap(25),
        CustomText(
          text: 'support@openui.design\n+60 825 876 \n08:00 - 22:00 - Everyday',
          color: Colors.white,
          size: 18,
          weight: FontWeight.w400,
          maxLines: 3,
          height: 1.8,
        ),
        Gap(25),
        Image.asset('assets/svgs/line.png', width: 125),
        Gap(25),
        CustomText(
          text: 'About     Contact     Blog',
          color: Colors.white,
          size: 18,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}
