import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/widgets/custom_text.dart';
import 'package:openfashion/widgets/svg_icon.dart';

class CustomCart extends StatefulWidget {
  const CustomCart({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  final String name;
  final String image;
  final double price;
  final String description;

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10),
        Image.asset('${widget.image}', fit: BoxFit.cover, width: 120),
        Gap(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(
              text: '${widget.name}'.toUpperCase(),
              color: AppColors.primary,
              letter: 2,
              size: 16,
              weight: FontWeight.w400,
            ),
            Gap(7),
            SizedBox(
              width: size.width * 0.6,
              child: CustomText(
                text: '${widget.description}',
                color: AppColors.secondary,
                size: 14,
                weight: FontWeight.w400,
              ),
            ),
            Gap(30),
            Row(
              children: [
                qty(() {
                  setState(() {
                    if (number > 1) {
                      number--;
                    }
                  });
                }, 'assets/svgs/min.svg'),
                Gap(12),
                CustomText(text: '$number', color: AppColors.primary, size: 22),
                Gap(12),
                qty(() {
                  setState(() {
                    number++;
                  });
                }, 'assets/svgs/plus.svg'),
              ],
            ),
            Gap(20),
            CustomText(
              text: '\$${widget.price}',
              color: AppColors.tertiary,
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
}

Widget qty(onTap, svg) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: SvgIcon(svg, AppColors.secondary, 17),
    ),
  );
}
