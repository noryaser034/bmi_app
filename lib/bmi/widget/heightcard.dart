import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class Heightcard extends StatelessWidget {
  const Heightcard({super.key, required this.height, required this.onChanged});
  final int height;
  final Function(double) onChanged;

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
          children: [
            Text(
              'Height',
              style: TextStyle(color: AppColors.textcolor, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'cm',
                  style: TextStyle(color: AppColors.textcolor, fontSize: 18),
                ),
              ],
            ),
            Slider(
              value: height.toDouble(),
              min: 80,
              max: 200,
              activeColor: AppColors.primarycolor,
              inactiveColor: AppColors.buttoncolor,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
