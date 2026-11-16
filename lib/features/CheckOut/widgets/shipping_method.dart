import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/features/CheckOut/view/place_order.dart';
import 'package:openfashion/widgets/custom_text.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Shipping Method'.toUpperCase(),
          color: AppColors.secondary.withOpacity(0.6),
          size: 16,
          weight: FontWeight.w400,
        ),

        Gap(15),
        customContainer('Pickup at store', Icons.keyboard_arrow_down, true),
      ],
    );
  }
}
