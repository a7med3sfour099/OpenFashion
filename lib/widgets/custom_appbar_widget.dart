import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:openfashion/widgets/svg_icon.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.isBlack});

  final bool isBlack;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final bgColor = isBlack ? Colors.black : Colors.white;
    final iconColor = isBlack ? Colors.white : Colors.black;
    return AppBar(
      backgroundColor: bgColor,
      leading: SvgIcon('assets/svgs/Menu.svg', iconColor, 24),
      title: SvgIcon('assets/logo/logo-bg.svg', iconColor, 32),
      centerTitle: true,
      actions: [
        SvgIcon('assets/svgs/Search.svg', iconColor, 24),
        const Gap(16),
        SvgIcon('assets/svgs/shopping bag.svg', iconColor, 24),
        const Gap(20),
      ],
    );
  }
}
