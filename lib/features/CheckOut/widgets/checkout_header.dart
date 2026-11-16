import 'package:flutter/material.dart';
import 'package:openfashion/widgets/custom_line.dart';

class CheckoutHeader extends StatelessWidget {
  const CheckoutHeader({super.key, required this.title, this.size = 28});

  final String title;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomLine(
            text: title,
            isBlack: true,
            size: size ?? 28,
            letter: 4,
            width: 160,
          ),
        ),
      ],
    );
  }
}
