import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/widgets/custom_text.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
    required this.text,
    this.isBlack = false,
    this.size = 24,
    this.letter = 0,
    this.width = 125,
  });

  final String text;
  final bool isBlack;
  final double size;
  final double letter;
  final double width;

  @override
  Widget build(BuildContext context) {
    final color = isBlack ? Colors.black : Colors.white;
    return Column(
      children: [
        CustomText(
          text: text.toUpperCase(),
          color: color,
          size: size,
          weight: FontWeight.w400,
          letter: letter,
        ),
        Gap(10),
        Image.asset(
          'assets/svgs/line.png',
          width: width,
          color: color,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
