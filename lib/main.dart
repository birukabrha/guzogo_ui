import 'package:flutter/material.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';
import 'package:guzogo_ui/controllers/navbar_controller.dart';
import 'package:guzogo_ui/screens/nav_bar.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MyNavBarController());
  Get.put(BookController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GuzoGo UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyNavBar(),
    );
  }
}
