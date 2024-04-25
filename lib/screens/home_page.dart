import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';
import 'package:guzogo_ui/data.dart';
import 'package:guzogo_ui/screens/airport_select.dart';
import 'package:guzogo_ui/widgets/custom_radio_button.dart';
import 'package:guzogo_ui/widgets/flight_picker.dart';
import 'package:guzogo_ui/widgets/table_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    BookController _bookController = Get.find();

    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 120,
        child: Column(
          children: [
            SizedBox(
              // height: 380,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/plane.jpeg',
                    width: double.infinity,
                    height: 380,
                    fit: BoxFit.cover,
                    color: const Color(0xff1e1c66),
                    colorBlendMode: BlendMode.darken,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 50,
                                height: 50,
                              ),
                              Image.asset(
                                'assets/images/logo.jpeg',
                                width: 80,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffa3a3a5),
                                      width: 3.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.notifications,
                                    size: 30,
                                    color: Color(0xffa3a3a5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRadioButton(text: 'Round', index: 1),
                              CustomRadioButton(text: 'One-way', index: 2),
                            ],
                          ),
                        ),
                        Obx(
                          () => Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'From',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => AirportSelect(
                                            isFrom: true,
                                          ),
                                        );
                                      },
                                      child: _bookController.from.value == 0
                                          ? const SizedBox(
                                              width: 150,
                                              height: 100,
                                              child: Center(
                                                child: Text(
                                                  'Select Airport',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : FlightPicker(
                                              code: airports[_bookController
                                                  .from.value]['code'],
                                              city: airports[_bookController
                                                  .from.value]['city'],
                                              airportName: airports[
                                                  _bookController.from
                                                      .value]['airport_name'],
                                            ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    int temp;
                                    temp = _bookController.from.value;
                                    _bookController.from.value =
                                        _bookController.to.value;
                                    _bookController.to.value = temp;
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        50,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.swap_horiz,
                                      color: Color(0xff1e1c66),
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'To',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => AirportSelect(
                                            isFrom: false,
                                          ),
                                        );
                                      },
                                      child: _bookController.to.value == 0
                                          ? const SizedBox(
                                              width: 150,
                                              height: 100,
                                              child: Center(
                                                child: Text(
                                                  'Select Airport',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : FlightPicker(
                                              code: airports[_bookController
                                                  .to.value]['code'],
                                              city: airports[_bookController
                                                  .to.value]['city'],
                                              airportName: airports[
                                                      _bookController.to.value]
                                                  ['airport_name']),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const TableContent(),
            Expanded(
              child: Container(),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width * .8,
                  55,
                ),
                maximumSize: Size(
                  MediaQuery.of(context).size.width * .8,
                  55,
                ),
                foregroundColor: const Color(0xff1e1c66),
                backgroundColor: const Color(0xfff1c933),
              ),
              child: const Text('Search Flights',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
