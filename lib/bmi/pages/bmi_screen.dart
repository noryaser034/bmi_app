import 'package:bmi_app/bmi/pages/result.dart';
import 'package:bmi_app/bmi/widget/counter_card.dart';
import 'package:bmi_app/bmi/widget/gendercard.dart';
import 'package:bmi_app/bmi/widget/heightcard.dart';
import 'package:bmi_app/core/colors.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int age = 10;
  int weight = 60;
  int height = 120;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      //------appbar-------
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Icon(Icons.local_pizza, color: Colors.amber),
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: AppColors.textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            //------male and female-------
            genderselection(),
            //------height-------
            Heightcard(
              height: height,
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
            ),
            //--------weight& age-------
            weightAndAge(),
            //---------calculate button-------
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primarycolor,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                double heightInMeter = weight / (height * height / 10000);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(bmi: heightInMeter),
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderselection() {
    return Expanded(
      child: Row(
        spacing: 16,
        children: [
          Gendercard(
            isSelected: isMale,
            text: 'male',
            icon: Icons.male,
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
          ),
          Gendercard(
            isSelected: !isMale,
            text: 'female',
            icon: Icons.female,
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded weightAndAge() {
    return Expanded(
      child: Row(
        spacing: 16,
        children: [
          Counter(
            text: 'Weight',
            number: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              setState(() {
                weight--;
              });
            },
          ),
          Counter(
            text: 'Age',
            number: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              setState(() {
                age--;
              });
            },
          ),
        ],
      ),
    );
  }
}
