

 import 'package:flutter/material.dart';
import 'calculater.dart'; // Make sure to import your calculator page

// ignore: camel_case_types
class home_page_no_state extends StatelessWidget {
  const home_page_no_state ({super.key});




  @override
  Widget build(BuildContext context) {
    // Navigate to calculator page after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/calculator');
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'), // Ensure you have logo.png in assets
      ),
    );
  }
}