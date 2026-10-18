import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.path, this.color, this.size);

  final String path;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        height: size,
        width: size,
      ),
    );
  }
}
