import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';
import 'package:guzogo_ui/data.dart';
import 'package:guzogo_ui/widgets/airport_list.dart';

class AirportSelect extends StatelessWidget {
  AirportSelect({
    super.key,
    required this.isFrom,
  });

  final bool isFrom;
  final BookController _bookController = Get.find();
  final SearchController _searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 140,
        leading: const Center(
          child: Text(
            'Select Airport',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff1e1c66),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff1e1c66),
              ),
            ),
          )
        ],
      ),
      body:
          // Obx(
          //   () =>
          SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                onChanged: (value) =>
                    _searchController.searchString.value = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 28,
                  ),
                  iconColor: Colors.black,
                  hintText: 'Search',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Divider(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Text(
                'Direct Airports',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: airports.length - 1,
                itemBuilder: (context, index) {
                  int indexx = index + 1;
                  return GestureDetector(
                    onTap: () {
                      isFrom
                          ? _bookController.to.value != indexx
                              ? _bookController.from.value = indexx
                              : null
                          : _bookController.from.value != indexx
                              ? _bookController.to.value = indexx
                              : null;
                      Get.back();
                    },
                    child: AirportList(
                      city: airports[indexx]['city'],
                      code: airports[indexx]['code'],
                      airportName: airports[indexx]['airport_name'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

class SearchController extends GetxController {
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
