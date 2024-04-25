import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.text,
    required this.index,
  });

  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    BookController _bookController = Get.find();
    return Obx(
      () => ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: _bookController.selectedOption.value == index
              ? const Color(0xff1e1c66)
              : Colors.white,
          backgroundColor: _bookController.selectedOption.value == index
              ? Colors.white
              : Colors.transparent,
          minimumSize: Size((MediaQuery.of(context).size.width - 55) / 2, 29),
          maximumSize: Size((MediaQuery.of(context).size.width - 55) / 2, 29),
        ),
        onPressed: () {
          _bookController.selectedOption.value = index;
        },
        child: Text(
          text,
        ),
      ),
    );
  }
}
