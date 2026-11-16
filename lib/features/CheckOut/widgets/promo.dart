import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/widgets/custom_text.dart';
import 'package:openfashion/widgets/svg_icon.dart';

class Promo extends StatelessWidget {
  const Promo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Gap(15),
      Divider(thickness: 1.5),
      Gap(15),
      Row(
        children: [
          SvgIcon('assets/svgs/promo.svg', AppColors.primary, 20),
          Gap(15),
          CustomText(
            text: 'Apply Promo Code',
            color: AppColors.primary,
            size: 16,
            weight: FontWeight.w500,
          ),
        ],
      ),
      Gap(15),
      Divider(thickness: 1.5),
      Gap(15),
      Row(
        children: [
          SvgIcon('assets/svgs/delivery.svg', AppColors.primary, 30),
          Gap(15),
          CustomText(
            text: 'Delivery',
            color: AppColors.primary,
            size: 16,
            weight: FontWeight.w500,
          ),
          Spacer(),
          CustomText(
            text: 'Free',
            color: AppColors.primary,
            size: 16,
            weight: FontWeight.w500,
          ),
        ],
      ),
      Gap(15),
      Divider(thickness: 1.5),
    ],
  );
  }
}