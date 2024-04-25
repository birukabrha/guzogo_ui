import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';
import 'package:guzogo_ui/widgets/cabin_class.dart';
import 'package:guzogo_ui/widgets/date_picker.dart';
import 'package:guzogo_ui/widgets/passenger_select.dart';
import 'package:intl/intl.dart';

class TableContent extends StatelessWidget {
  const TableContent({super.key});

  @override
  Widget build(BuildContext context) {
    BookController _bookController = Get.find();
    return Obx(
      () => Table(
        border: TableBorder.all(
          color: Colors.grey,
          width: .5,
        ),
        children: [
          TableRow(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                // color: Colors.red,
                child: GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      const MyDatePicker(),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Departure Date',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            _bookController.departureDate.value.day.toString(),
                            style: const TextStyle(
                              height: 1,
                              fontSize: 48,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('MMM').format(
                                    _bookController.departureDate.value),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                DateFormat('EEEE').format(
                                    _bookController.departureDate.value),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                child: _bookController.selectedOption.value == 2
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Return Date',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                _bookController.returnDate.value.day.toString(),
                                style: const TextStyle(
                                  height: 1,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat('MMM').format(
                                        _bookController.returnDate.value),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('EEEE').format(
                                        _bookController.returnDate.value),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cabin Class',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(const CabinSelect());
                      },
                      child: Text(
                        _bookController.cabinClass.value,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Passengers',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(const PassengerSelect());
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.man,
                            size: 28,
                          ),
                          Text(
                            _bookController.adultPassengers.value.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.man,
                          ),
                          Text(
                            _bookController.childPassengers.value.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.child_care,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            _bookController.infantPassengers.value.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
