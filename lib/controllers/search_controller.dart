import 'package:get/get.dart';
import 'package:guzogo_ui/data.dart';

class MySearchController extends GetxController {
  Rx<bool> isTrue = true.obs;
  RxList<dynamic> fullList = airports.obs;
  RxList<dynamic> filteredList = [].obs;
  var searchString = ''.obs;

  void printTest() {
    print('Filtered list = ${filteredList.value}');
    print('Search String = ${searchString.value}');
  }

  void filterAirport(String searchString) {
    var temp = fullList.value..removeAt(0);
    filteredList.value = temp
        .where((element) => element['airport_name']
            .toLowerCase()
            .contains(searchString.toLowerCase()))
        .toList();
  }
}
