import 'package:episode_1/utils/constants.dart';
import 'package:episode_1/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? width;
  const OptionButton({Key? key, this.text, this.icon, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: MaterialButton(
        splashColor: COLOR_WHITE,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        color: COLOR_DARK_BLUE,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon!,
              color: COLOR_WHITE.withAlpha(55),
            ),
            addHorizontalSpace(10),
            Text(
              "$text",
              style: TextStyle(color: COLOR_WHITE),
            ),
          ],
        ),
      ),
    );
  }
}
