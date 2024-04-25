import 'package:flutter/material.dart';

class AirportList extends StatelessWidget {
  const AirportList({
    super.key,
    required this.code,
    required this.airportName,
    required this.city,
  });

  final String code;
  final String airportName;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.flight,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    '$city, $airportName ($code)',
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
