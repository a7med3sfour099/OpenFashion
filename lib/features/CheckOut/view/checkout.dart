import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/features/CheckOut/view/place_order.dart';
import 'package:openfashion/features/CheckOut/widgets/checkout_header.dart';
import 'package:openfashion/features/CheckOut/widgets/promo.dart';
import 'package:openfashion/widgets/custom_cart.dart';
import 'package:openfashion/widgets/custom_appbar_widget.dart';
import 'package:openfashion/widgets/custom_button.dart';
import 'package:openfashion/widgets/custom_text.dart';

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
  int selectedQty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: Column(
            children: [
              Gap(25),
              CheckoutHeader(title: 'Checkout'),
              Gap(10),

              /// Cart
              CustomCart(
                name: widget.name,
                image: widget.image,
                price: widget.price,
                description: widget.description,
                onChange: (value) {
                  setState(() {
                    selectedQty = value;
                  });
                },
              ),

              Promo(),

              Spacer(),

              /// Total
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
                    text:
                        '\$${((widget.price * selectedQty).toStringAsFixed(2))}',
                    color: AppColors.tertiary,
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              Gap(25),

              /// Checkout Button
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceOrder(
                        name: widget.name,
                        image: widget.image,
                        price: widget.price,
                        qty: selectedQty,
                        total: widget.price * selectedQty,
                        description: widget.description,
                      ),
                    ),
                  );
                },
                title: 'Checkout',
                is_Svg: true,
              ),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}