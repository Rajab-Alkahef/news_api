import 'package:flutter/material.dart';

class CustomPopMenuItem extends StatelessWidget {
  const CustomPopMenuItem({
    super.key,
    required this.itemName,
    required this.itemIcon,
    required this.filterColor,
  });
  final String itemName;
  final IconData itemIcon;
  final Color filterColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(itemIcon, color: filterColor),
        const SizedBox(
          width: 12,
        ),
        Text(
          itemName,
          style: TextStyle(color: filterColor),
        ),
      ],
    );
  }
}
