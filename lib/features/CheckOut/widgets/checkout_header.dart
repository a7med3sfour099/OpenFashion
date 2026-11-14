import 'package:flutter/material.dart';
import 'package:openfashion/widgets/custom_line.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CustomLine(
            text: title,
            isBlack: true,
            size: 28,
            letter: 4,
            width: 160,
          ),
        ),
      ],
    );
  }
}
