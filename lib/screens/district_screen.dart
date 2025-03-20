import 'package:flutter/material.dart';

class DistrictScreen extends StatelessWidget {
  final String regionName;

  const DistrictScreen({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> districtData = {
      "Region A": [
        {"name": "District 1", "value": 10},
        {"name": "District 2", "value": 30},
        {"name": "District 3", "value": 20},
      ],
      "Region B": [
        {"name": "District 4", "value": 40},
        {"name": "District 5", "value": 50},
      ],
      "Region C": [
        {"name": "District 6", "value": 5},
        {"name": "District 7", "value": 15},
      ],
      "Region D": [
        {"name": "District 8", "value": 35},
        {"name": "District 9", "value": 45},
      ],
    };

    List<Map<String, dynamic>> districts = districtData[regionName] ?? [];
    int minValue = districts.isNotEmpty ? districts.map((d) => d["value"]).reduce((a, b) => a < b ? a : b) : 0;
    int maxValue = districts.isNotEmpty ? districts.map((d) => d["value"]).reduce((a, b) => a > b ? a : b) : 0;

    return Scaffold(
      appBar: AppBar(title: Text("Districts of $regionName")),
      body: ListView.builder(
        itemCount: districts.length,
        itemBuilder: (context, index) {
          int value = districts[index]["value"];
          Color color = (value == minValue)
              ? Colors.green
              : (value == maxValue)
              ? Colors.red
              : Colors.orange;

          return ListTile(
            title: Text(districts[index]["name"]),
            trailing: Text(value.toString(), style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          );
        },
      ),
    );
  }
}
