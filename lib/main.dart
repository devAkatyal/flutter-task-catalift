import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/main_screen.dart';
// import 'utils/app_colors.dart'; // If you want to set a global theme

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalift App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // You can customize this
        // If using AppColors, you can define more theme properties here
        // e.g., scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins', // Example: Add a custom font
      ),
      home: MainScreen(),
    );
  }
}