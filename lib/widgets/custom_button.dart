import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/widgets/custom_text.dart';
import 'package:openfashion/widgets/svg_icon.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.is_Svg, required this.title, required this.onTap});

  final bool is_Svg;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    bool isSvg = is_Svg;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg
                ? SvgIcon('assets/svgs/shopping bag.svg', Colors.white, 25)
                : SizedBox.shrink(),
            Gap(15),
            CustomText(
              text: '${title}'.toUpperCase(),
              color: Colors.white,
              size: 22,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
