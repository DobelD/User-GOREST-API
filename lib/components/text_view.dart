import 'package:flutter/material.dart';

import '../styles/app_typo.dart';

class TextView extends StatelessWidget {
  const TextView({super.key, this.keys, this.value});

  final String? keys;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$keys',
            style: AppTypo.heading2,
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              ':',
              style: AppTypo.heading2,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Text(
            '$value',
            overflow: TextOverflow.ellipsis,
            style: AppTypo.highlight2,
          ),
        ),
      ],
    );
  }
}
