import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';

class PassengerSelect extends StatelessWidget {
  const PassengerSelect({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    BookController _bookController = Get.find();
    int adult = _bookController.adultPassengers.value;
    int children = _bookController.childPassengers.value;
    int infant = _bookController.infantPassengers.value;

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
                  'Passengers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        _bookController.adultPassengers.value = adult;
                        _bookController.childPassengers.value = children;
                        _bookController.infantPassengers.value = infant;

                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Adult',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        maximumSize: const Size(25, 25),
                        minimumSize: const Size(25, 25),
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _bookController.adultPassengers.value == 1
                            ? null
                            : _bookController.adultPassengers.value =
                                _bookController.adultPassengers.value - 1;
                      },
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          size: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        _bookController.adultPassengers.value.toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        maximumSize: const Size(25, 25),
                        minimumSize: const Size(25, 25),
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _bookController.adultPassengers.value =
                            _bookController.adultPassengers.value + 1;
                      },
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'Children   ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    TextSpan(
                        text: '2-12 Years',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                        )),
                  ]),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        maximumSize: const Size(25, 25),
                        minimumSize: const Size(25, 25),
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _bookController.childPassengers.value == 0
                            ? null
                            : _bookController.childPassengers.value =
                                _bookController.childPassengers.value - 1;
                      },
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          size: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        _bookController.childPassengers.value.toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        maximumSize: const Size(25, 25),
                        minimumSize: const Size(25, 25),
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _bookController.childPassengers.value =
                            _bookController.childPassengers.value + 1;
                      },
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'Infant   ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    TextSpan(
                        text: '< 2 Years',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                        )),
                  ]),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        maximumSize: const Size(25, 25),
                        minimumSize: const Size(25, 25),
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _bookController.infantPassengers.value == 0
                            ? null
                            : _bookController.infantPassengers.value =
                                _bookController.infantPassengers.value - 1;
                      },
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          size: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        _bookController.infantPassengers.value.toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        maximumSize: const Size(25, 25),
                        minimumSize: const Size(25, 25),
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _bookController.infantPassengers.value =
                            _bookController.infantPassengers.value + 1;
                      },
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
