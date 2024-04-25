import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/navbar_controller.dart';

class MyNavBar extends StatelessWidget {
  MyNavBar({super.key});

  final MyNavBarController _navBarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
            width: .5,
            color: Colors.grey,
          ))),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              enableFeedback: false,
              onTap: (value) => _navBarController.selectedIndex.value = value,
              type: BottomNavigationBarType.fixed,
              currentIndex: _navBarController.selectedIndex.value,
              elevation: 0,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              selectedIconTheme: const IconThemeData(
                size: 36,
              ),
              unselectedIconTheme: const IconThemeData(
                size: 36,
              ),
              selectedItemColor: const Color(0xff1e1c66),
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  label: 'Search',
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: 'Booking',
                  icon: Icon(Icons.luggage),
                ),
                BottomNavigationBarItem(
                  label: 'Notifications',
                  icon: Icon(Icons.notifications),
                ),
                BottomNavigationBarItem(
                  label: 'Setting',
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ),
        body: _navBarController.screens[_navBarController.selectedIndex.value],
      ),
    );
  }
}
