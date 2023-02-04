import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../styles/app_color.dart';
import '../styles/app_typo.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key, this.hintText, this.onChange});

  final String? hintText;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: TextField(
          style: AppTypo.highlight2,
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTypo.hint,
            prefixIcon: Icon(IconlyLight.search, size: 22),
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
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
