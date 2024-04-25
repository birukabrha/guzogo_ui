import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:guzogo_ui/screens/home_page.dart';

class MyNavBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Booking Page',
        ),
      ),
    ),
    Container(
      color: Colors.orange,
      child: const Center(
        child: Text(
          'Notifications Page',
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'Setting Page',
        ),
      ),
    ),
  ];
}
