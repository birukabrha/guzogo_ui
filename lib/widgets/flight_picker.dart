import 'package:flutter/material.dart';

class FlightPicker extends StatelessWidget {
  const FlightPicker({
    super.key,
    required this.code,
    required this.city,
    required this.airportName,
  });

  final String code;
  final String city;
  final String airportName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            code,
            style: const TextStyle(
              height: 1.2,
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            city,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            airportName,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              wordSpacing: 0,
              letterSpacing: .1,
            ),
          ),
        ],
      ),
    );
  }
}
