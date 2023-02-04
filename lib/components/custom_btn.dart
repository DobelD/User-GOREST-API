import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_typo.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.color, this.onPressed, this.text});

  final Color? color;
  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 42,
        width: Get.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            onPressed: onPressed,
            child: Text(
              "$text",
              style: AppTypo.highlight2,
            )));
  }
}
