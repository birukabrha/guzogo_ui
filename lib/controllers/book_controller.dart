import 'package:get/get.dart';

class BookController extends GetxController {
  Rx<int> selectedOption = 1.obs;
  Rx<String> cabinClass = 'Economy'.obs;
  var departureDate = DateTime.now().obs;
  var returnDate = DateTime.now().obs;
  Rx<int> adultPassengers = 1.obs;
  Rx<int> childPassengers = 0.obs;
  Rx<int> infantPassengers = 0.obs;
  var from = 1.obs;
  var to = 0.obs;
}
