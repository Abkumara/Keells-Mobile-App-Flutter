import 'package:flutter/material.dart';

import 'package:keellsapp/widegets/colors.dart';

class CheckBoxSet extends StatelessWidget {
  const CheckBoxSet({
    super.key,
    required this.filterBool,
    required this.filterName,
    required this.onChange,
  });
  final bool filterBool;
  final String filterName;
  final void Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
            value: filterBool,
            activeColor: keellsColor,
            onChanged: (value) {
              onChange(value ?? false);
            },
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            filterName,
            style: TextStyle(
              color: filterBool ? keellsColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
