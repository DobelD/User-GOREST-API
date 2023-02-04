import 'package:flutter/material.dart';

import '../styles/app_color.dart';
import '../styles/app_typo.dart';

class FormText extends StatelessWidget {
  const FormText({super.key, this.hint, this.controller});

  final String? hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: TextField(
          controller: controller,
          style: AppTypo.highlight2,
          decoration: InputDecoration(
            hintText: '$hint',
            hintStyle: AppTypo.hint,
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.disableColor, width: 1.2),
                borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.primaryColor, width: 1.2),
                borderRadius: BorderRadius.circular(6)),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.disableColor, width: 1.2),
                borderRadius: BorderRadius.circular(6)),
          ),
        ));
  }
}
