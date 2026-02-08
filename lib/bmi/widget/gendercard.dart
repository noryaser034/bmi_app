import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class Gendercard extends StatelessWidget {
  const Gendercard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });
  final String text;
  final IconData icon;
  final Function() onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: (isSelected) ? AppColors.primarycolor : AppColors.cardcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.textcolor, size: 80),
              Text(
                text,
                style: TextStyle(color: AppColors.textcolor, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
