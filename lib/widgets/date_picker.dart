import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BookController _bookController = Get.find();
    List<DateTime?> _oneWay = [
      DateTime(DateTime.now().year, DateTime.now().month),
    ];
    List<DateTime?> _multiTripRange = [
      DateTime(DateTime.now().year, DateTime.now().month),
    ];
    return Obx(
      () => Container(
        height: 500,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                Text(
                    _bookController.selectedOption.value == 2
                        ? 'Please select departure date'
                        : 'Please select departure and return date',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1e1c66),
                    ))
              ],
            ),
            Container(
              color: Colors.white,
              child: _bookController.selectedOption.value == 2
                  ? CalendarDatePicker2(
                      onValueChanged: (value) {
                        _oneWay = value;
                      },
                      config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                          selectedDayHighlightColor: Colors.yellow,
                          currentDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2026)),
                      value: _oneWay)
                  : CalendarDatePicker2(
                      onValueChanged: (value) {
                        _multiTripRange = value;
                      },
                      config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.range,
                          selectedDayHighlightColor: Colors.yellow,
                          selectedRangeHighlightColor: Colors.limeAccent,
                          currentDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2026)),
                      value: _multiTripRange),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .92,
              child: ElevatedButton(
                onPressed: () {
                  if (_bookController.selectedOption.value == 2) {
                    _bookController.departureDate.value = _oneWay[0]!;
                  } else {
                    _bookController.departureDate.value = _multiTripRange[0]!;
                    _bookController.returnDate.value = _multiTripRange[1]!;
                  }
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    backgroundColor: Colors.yellow),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Color(0xff1e1c66),
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
