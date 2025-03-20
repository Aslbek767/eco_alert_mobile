import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedRegion;

  // Data for regions and their districts
  Map<String, List<Map<String, dynamic>>> regionData = {
    "Karakalpakstan Republic": [
      { "name": "Nukus District", "value": 0 },
      { "name": "Amudarya District", "value": 20 },
      { "name": "Beruniy District", "value": 50 },
      { "name": "Chimbay District", "value": 30 },
      { "name": "Ellikqala District", "value": 60 },
      { "name": "Kegeyli District", "value": 40 },
      { "name": "Moynaq District", "value": 10 },
      { "name": "Nukus City", "value": 90 },
      { "name": "Qanliko'l District", "value": 35 },
      { "name": "Qong'irot District", "value": 70 },
      { "name": "Shumanay District", "value": 25 },
      { "name": "Taxtako'pir District", "value": 45 },
      { "name": "To'rtko'l District", "value": 80 },
      { "name": "Xo'jayli District", "value": 55 }
    ],
    "Andijan Region": [
      { "name": "Andijan District", "value": 30 },
      { "name": "Asaka District", "value": 60 },
      { "name": "Boz District", "value": 90 },
      { "name": "Baliqchi District", "value": 20 },
      { "name": "Bulokboshi District", "value": 50 },
      { "name": "Izboskan District", "value": 40 },
      { "name": "Jalaquduq District", "value": 10 },
      { "name": "Khodjaabad District", "value": 70 },
      { "name": "Kurgontepa District", "value": 25 },
      { "name": "Marhamat District", "value": 55 },
      { "name": "Oltinkol District", "value": 80 },
      { "name": "Pakhtaabad District", "value": 45 },
      { "name": "Shahrihan District", "value": 65 },
      { "name": "Ulugnor District", "value": 35 },
      { "name": "Andijan City", "value": 95 },
      { "name": "Khonobod City", "value": 85 }
    ],
    "Bukhara Region": [
      { "name": "Bukhara District", "value": 10 },
      { "name": "Gijduvon District", "value": 40 },
      { "name": "Jondor District", "value": 70 },
      { "name": "Kogon District", "value": 30 },
      { "name": "Karakul District", "value": 60 },
      { "name": "Olot District", "value": 50 },
      { "name": "Peshku District", "value": 20 },
      { "name": "Romitan District", "value": 90 },
      { "name": "Shofirkon District", "value": 25 },
      { "name": "Vobkent District", "value": 55 },
      { "name": "Bukhara City", "value": 85 },
      { "name": "Kogon City", "value": 75 }
    ],
    "Fergana Region": [
      { "name": "Baghdad District", "value": 30 },
      { "name": "Besharik District", "value": 60 },
      { "name": "Buvayda District", "value": 90 },
      { "name": "Dangara District", "value": 40 },
      { "name": "Fergana District", "value": 50 },
      { "name": "Furkat District", "value": 10 },
      { "name": "Kushtepa District", "value": 70 },
      { "name": "Oltiariq District", "value": 25 },
      { "name": "Ozbekiston District", "value": 80 },
      { "name": "Rishton District", "value": 55 },
      { "name": "Sokh District", "value": 20 },
      { "name": "Toshloq District", "value": 75 },
      { "name": "Uchkuprik District", "value": 45 },
      { "name": "Yozyovon District", "value": 95 },
      { "name": "Fergana City", "value": 85 },
      { "name": "Kokand City", "value": 35 },
      { "name": "Margilan City", "value": 65 }
    ],
    "Jizzakh Region": [
      { "name": "Arnasay District", "value": 20 },
      { "name": "Bakhmal District", "value": 60 },
      { "name": "Dustlik District", "value": 40 },
      { "name": "Forish District", "value": 50 },
      { "name": "Gallaorol District", "value": 10 },
      { "name": "Jizzakh District", "value": 30 },
      { "name": "Mirzachul District", "value": 90 },
      { "name": "Pakhtakor District", "value": 25 },
      { "name": "Yangiobod District", "value": 70 },
      { "name": "Zafarobod District", "value": 80 },
      { "name": "Zarbdar District", "value": 55 },
      { "name": "Zomin District", "value": 75 },
      { "name": "Jizzakh City", "value": 85 }
    ],
    "Kashkadarya Region": [
      { "name": "Chirakchi District", "value": 50 },
      { "name": "Dehqonobod District", "value": 30 },
      { "name": "Guzar District", "value": 60 },
      { "name": "Kamashi District", "value": 70 },
      { "name": "Karshi District", "value": 20 },
      { "name": "Kasbi District", "value": 80 },
      { "name": "Kitab District", "value": 90 },
      { "name": "Koson District", "value": 10 },
      { "name": "Mirishkor District", "value": 40 },
      { "name": "Muborak District", "value": 55 },
      { "name": "Nishon District", "value": 25 },
      { "name": "Shahrisabz District", "value": 35 },
      { "name": "Yakkabog District", "value": 75 },
      { "name": "Karshi City", "value": 95 },
      { "name": "Shahrisabz City", "value": 85 }
    ]
  };

  List<Color> colors = [
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.green,
    Colors.red,
    Colors.teal
  ]; // Generate enough colors

  List<PieChartSectionData> getSections() {
    List<String> regions = regionData.keys.toList();

    return List.generate(regions.length, (index) {
      return PieChartSectionData(
        color: colors[index % colors.length], // Cycle through colors
        value: 100 / regions.length, // Assume equal distribution
        title: regions[index],
        radius: selectedRegion == regions[index] ? 75 : 60,
        titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> regions = regionData.keys.toList();

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        children: [
          SizedBox(height: 20),

          // Pie Chart
          GestureDetector(
            onTapUp: (TapUpDetails details) {
              RenderBox box = context.findRenderObject() as RenderBox;
              Offset local = box.globalToLocal(details.globalPosition);
              setState(() {
                selectedRegion = regions[local.dx ~/ 100 % regions.length]; // Example selection
              });
            },
            child: Container(
              height: 300,
              child: PieChart(
                PieChartData(
                  sections: getSections(),
                  centerSpaceRadius: 50,
                  sectionsSpace: 3,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Show Districts below the chart when a region is selected
          if (selectedRegion != null) ...[
            Text("$selectedRegion", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: regionData[selectedRegion]!.length,
                itemBuilder: (context, index) {
                  var district = regionData[selectedRegion]![index];
                  int value = district["value"];
                  Color color = value < 30
                      ? Colors.green
                      : (value < 60 ? Colors.orange : Colors.red);

                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      title: Text(district["name"]),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("${district["value"]}",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
