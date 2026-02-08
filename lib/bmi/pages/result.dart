import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.bmi});

  final double bmi;

  Status getResult() {
    if (bmi < 18.5) {
      return Status(
        'UNDERWEIGHT',
        Colors.blue,
        'Your body weight is below normal.',
      );
    } else if (bmi < 25) {
      return Status(
        'NORMAL',
        Colors.green,
        'Your body weight is absolutely normal.\nGood job 💪',
      );
    } else if (bmi < 30) {
      return Status(
        'OVERWEIGHT',
        Colors.orange,
        'Your body weight is above normal.',
      );
    } else {
      return Status(
        'OBESE',
        Colors.red,
        'Your body weight is much higher than normal.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = getResult();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: BackButton(color: AppColors.textcolor),
        title: Text(
          'Your result',
          style: TextStyle(color: AppColors.textcolor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Result Card
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.cardcolor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      status.title,
                      style: TextStyle(
                        color: status.color,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      status.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textcolor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Recalculate Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Recalculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Status {
  final String title;
  final Color color;
  final String message;

  Status(this.title, this.color, this.message);
}
