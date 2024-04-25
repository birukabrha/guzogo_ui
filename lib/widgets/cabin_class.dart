import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';

class CabinSelect extends StatelessWidget {
  const CabinSelect({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    BookController _bookController = Get.find();
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(10),
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cabin Class',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                _bookController.cabinClass.value == 'Economy'
                    ? null
                    : _bookController.cabinClass.value = 'Economy';

                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Economy',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _bookController.cabinClass.value == 'Economy'
                      ? const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                _bookController.cabinClass.value == 'Business'
                    ? null
                    : _bookController.cabinClass.value = 'Business';

                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Business',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _bookController.cabinClass.value == 'Business'
                      ? const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                _bookController.cabinClass.value == 'First'
                    ? null
                    : _bookController.cabinClass.value = 'First';

                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'First',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _bookController.cabinClass.value == 'First'
                      ? const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.check,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
