import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';

class ProductOrderToggleTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ProductOrderToggleTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color tabColor = isSelected ? AppTheme.red : AppTheme.black20;
    Color textColor = isSelected ? AppTheme.white : AppTheme.black;
    if (label == 'รายการสินค้า') {
      tabColor = isSelected ? AppTheme.red : AppTheme.black20;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 190,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: tabColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: isSelected ? FontWeight.normal : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}