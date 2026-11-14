import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/features/CheckOut/widgets/checkout_header.dart';
import 'package:openfashion/widgets/custom_cart.dart';
import 'package:openfashion/widgets/custom_appbar_widget.dart';
import 'package:openfashion/widgets/custom_button.dart';
import 'package:openfashion/widgets/custom_text.dart';
import 'package:openfashion/widgets/svg_icon.dart';

class Checkout extends StatefulWidget {
  const Checkout({
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
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Gap(25),
              Header(title: 'Checkout'),
              Gap(10),

              CustomCart(
                name: widget.name,
                image: widget.image,
                price: widget.price,
                description: widget.description,
              ),

              promo(),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'est. Total'.toUpperCase(),
                    color: AppColors.primary,
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  CustomText(
                    text: '\$${widget.price}',
                    color: AppColors.tertiary,
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              Gap(25),
              CustomButton(onTap: () {}, title: 'Checkout', is_Svg: true),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}

Widget promo() {
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
