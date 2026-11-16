import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/features/CheckOut/data/address_model.dart';
import 'package:openfashion/widgets/custom_text.dart';
import 'package:openfashion/widgets/svg_icon.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({super.key, this.savedAddress, this.onTap});

  final AddressModel? savedAddress;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: '${savedAddress!.firstName} ${savedAddress!.lastName}',
                color: AppColors.primary,
                size: 16,
                weight: FontWeight.w600,
              ),
              Gap(5),
              CustomText(
                text:
                    '${savedAddress!.address}\n${savedAddress!.city}, ${savedAddress!.state} ${savedAddress!.zipCode}',
                color: AppColors.secondary,
                size: 16,
                weight: FontWeight.w400,
                maxLines: 2,
                height: 1.8,
              ),
              Gap(5),
              CustomText(
                text: '[${savedAddress!.phoneNumber}]',
                color: AppColors.secondary,
                size: 16,
                weight: FontWeight.w400,
              ),
            ],
          ),
          SvgIcon('assets/svgs/arrow.svg', AppColors.primary, 25),
        ],
      ),
    );
  }
}
