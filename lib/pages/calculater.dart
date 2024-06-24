import 'package:flutter/material.dart';

class CalculaterPage extends StatefulWidget {
  const CalculaterPage({super.key});

  @override
  State<CalculaterPage> createState() => _CalculaterPageState();
}

class _CalculaterPageState extends State<CalculaterPage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  double? bmi;
  String? bmiCategory;

  void calculateBMI() {
    final double height = double.parse(heightController.text) / 100; // converting height to meters
    final double weight = double.parse(weightController.text);
    final int age = int.parse(ageController.text);

    setState(() {
      bmi = weight / (height * height);
      bmiCategory = _getBMICategory(bmi!, age);
    });
  }

  String _getBMICategory(double bmi, int age) {
    if (age < 18) {
      if (bmi < 18.5) {
        return "Underweight (Child/Teen)";
      } else if (bmi < 24.9) {
        return "Normal weight (Child/Teen)";
      } else if (bmi < 29.9) {
        return "Overweight (Child/Teen)";
      } else {
        return "Obesity (Child/Teen)";
      }
    } else {
      if (bmi < 18.5) {
        return "Underweight";
      } else if (bmi < 24.9) {
        return "Normal weight";
      } else if (bmi < 29.9) {
        return "Overweight";
      } else {
        return "Obesity";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculate Your Body Mass Index (BMI)",
          style: TextStyle(
            fontFamily: 'oswald',
            fontSize: 20, // change to your desired size
            fontWeight: FontWeight.bold, // change to your desired weight
            color: Colors.white, // change to your desired color
          ),
        ),
        backgroundColor: Colors.indigo,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png',height: 250, // Path to your logo image
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/thh.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    controller: heightController,
                    decoration: InputDecoration(
                      hintText: "Enter height in cm",
                      hintStyle: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'rubik',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 45, 21, 101)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(
                      hintText: "Enter weight in kg",
                      hintStyle: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'rubik',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 117, 45, 147)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      hintText: "Enter age",
                      hintStyle: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'rubik',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 90, 35, 130)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: calculateBMI,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Calculate BMI'),
                  ),
                  const SizedBox(height: 20),
                  if (bmi != null) ...[
                    Text(
                      'Your BMI is ${bmi!.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      'Category: $bmiCategory',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/BMIpic.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
