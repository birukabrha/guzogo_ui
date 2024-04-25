import 'package:get/get.dart';
import 'package:guzogo_ui/data.dart';

class MySearchController extends GetxController {
  var fullList = airports.obs;
  var filteredList = [].obs;
  var searchString = ''.obs;

  void filterAirport(searchString) {
    filteredList.value = fullList
        .where((element) =>
            element.name.toLowerCase().contains(searchString.toLowerCase()))
        .toList();
  }
}
