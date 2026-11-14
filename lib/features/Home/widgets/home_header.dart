import 'package:flutter/material.dart';
import 'package:openfashion/core/constants/app_colors.dart';
import 'package:openfashion/widgets/svg_icon.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return               Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgIcon('assets/texts/10.svg', AppColors.secondary, 180),
                  Positioned(
                    top: 120,
                    left: 30,
                    right: 0,
                    child: SvgIcon(
                      'assets/texts/Collection.svg',
                      Colors.white,
                      15,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 50,
                    right: 0,
                    // bottom: 0,
                    child: SvgIcon(
                      'assets/texts/October.svg',
                      Colors.white,
                      42,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/cover/cover1.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 420,
                    left: 140,
                    child: SvgIcon(
                      'assets/texts/10.svg',
                      AppColors.primary.withOpacity(0.5),
                      245,
                    ),
                  ),
                ],
              );
  }
}