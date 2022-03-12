import 'package:episode_1/utils/constants.dart';
import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final double? width, height;
  final Widget child;
  final EdgeInsets? padding;

  BorderBox({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Center(child: child),
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
    );
  }
}
