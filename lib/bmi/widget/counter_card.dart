import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key, required this.text, required this.number, required this.onAdd, required this.onRemove  });
  final String text;
  final int number;
  final Function() onAdd;
  final Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Text(
              text,
              style: TextStyle(
                color: AppColors.textcolor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              number.toString(),
              style: TextStyle(color: AppColors.textcolor, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.buttoncolor,
                  ),
                  onPressed: onRemove,
                  icon: Icon(Icons.remove, color: AppColors.textcolor),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.buttoncolor,
                  ),
                  onPressed: onAdd,
                  icon: Icon(Icons.add, color: AppColors.textcolor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
