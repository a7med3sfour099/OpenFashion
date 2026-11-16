import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/features/CheckOut/data/address_model.dart';
import 'package:openfashion/features/CheckOut/view/add_address.dart';
import 'package:openfashion/features/CheckOut/widgets/address_info.dart';
import 'package:openfashion/features/CheckOut/widgets/checkout_header.dart';
import 'package:openfashion/features/CheckOut/widgets/shipping_method.dart';
import 'package:openfashion/widgets/custom_appbar_widget.dart';
import 'package:openfashion/widgets/custom_button.dart';
import 'package:openfashion/widgets/custom_text.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.qty,
    required this.total,
    required this.description,
  });

  final String name;
  final String image;
  final double price;
  final int qty;
  final double total;
  final String description;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  AddressModel? _savedAddress;

  void _openAddress(BuildContext context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddAddress()),
    );
    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  void _editAddress() async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddAddress(editData: _savedAddress),
      ),
    );
    setState(() {
      _savedAddress = newAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(25),
              CheckoutHeader(title: 'Checkout'),
              Gap(15),

              CustomText(
                text: 'Shipping Address'.toUpperCase(),
                color: AppColors.secondary.withOpacity(0.6),
                size: 16,
                weight: FontWeight.w400,
              ),
              Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    _savedAddress != null
                        ? AddressInfo(
                            savedAddress: _savedAddress,
                            onTap: _editAddress,
                          )
                        : SizedBox.shrink(),
                    Gap(15),
                    _savedAddress == null
                        ? GestureDetector(
                            onTap: () => _openAddress(context),
                            child: customContainer(
                              'Add Shipping Address',
                              Icons.add,
                              false,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              Gap(35),

              /// Shipping Method
              ShippingMethod(),
              Gap(35),

              /// Payment Method
              CustomText(
                text: 'Payment Method'.toUpperCase(),
                color: AppColors.secondary.withOpacity(0.6),
                size: 16,
                weight: FontWeight.w400,
              ),
              Gap(15),
              customContainer(
                'Select Payment Method',
                Icons.keyboard_arrow_down,
                false,
              ),

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
                    text: '\$${widget.total.toStringAsFixed(2)}',
                    color: AppColors.tertiary,
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              Gap(25),

              /// Place Order
              CustomButton(onTap: () {}, title: 'Place Order', is_Svg: true),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customContainer(String text, icon, isFree) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
    decoration: BoxDecoration(
      color: AppColors.secondary.withOpacity(0.05),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          color: AppColors.secondary,
          size: 16,
          weight: FontWeight.w600,
        ),
        Spacer(),
        isFree
            ? CustomText(
                text: 'Free',
                color: AppColors.secondary,
                size: 16,
                weight: FontWeight.w600,
              )
            : SizedBox.shrink(),
        Gap(10),
        Icon(icon, color: AppColors.secondary),
      ],
    ),
  );
}
