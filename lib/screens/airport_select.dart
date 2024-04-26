// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guzogo_ui/controllers/book_controller.dart';
import 'package:guzogo_ui/controllers/search_controller.dart';
import 'package:guzogo_ui/data.dart';
import 'package:guzogo_ui/widgets/airport_list.dart';

class AirportSelect extends StatelessWidget {
  AirportSelect({
    super.key,
    required this.isFrom,
  });

  final bool isFrom;
  final BookController _bookController = Get.find();
  final MySearchController _searchController = Get.put(MySearchController());

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
      body: Obx(
        () => _searchController.isTrue.value
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        onChanged: (value) {
                          _searchController.searchString.value = value;
                          _searchController.printTest();
                          if (value.isNotEmpty) {
                            _searchController.filterAirport(value);
                          }
                        },
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
                            child: _searchController.searchString.value == ''
                                ? AirportList(
                                    city: _searchController
                                        .fullList.value[indexx]['city'],
                                    code: _searchController
                                        .fullList.value[indexx]['code'],
                                    airportName: _searchController
                                        .fullList.value[indexx]['airport_name'],
                                  )
                                : _searchController
                                        .filteredList.value.isNotEmpty
                                    ? AirportList(
                                        city: _searchController
                                            .filteredList.value[indexx]['city'],
                                        code: _searchController
                                            .filteredList.value[indexx]['code'],
                                        airportName: _searchController
                                            .filteredList
                                            .value[indexx]['airport_name'],
                                      )
                                    : Container(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
