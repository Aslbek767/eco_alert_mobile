import 'package:eco_alert/screens/detailed_report_page.dart';
import 'package:eco_alert/screens/report_incident.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<Map<String, dynamic>> reports = [
    {
      "title": "Amazon Report",
      "description": "Deforestation impact in Amazon.",
      "date": "Oct 15, 2023",
      "image": "lib/images/image1.jpg"
    },
    {
      "title": "Beach Cleanup",
      "description": "Community beach cleanup event.",
      "date": "Oct 15, 2023",
      "image": "lib/images/image2.jpg"
    },
    {
      "title": "Solar Initiative",
      "description": "New solar power initiative launched.",
      "date": "Oct 15, 2023",
      "image": "lib/images/image3.jpg"
    },
  ];

  void _submitReport(String title, String description, String image) {
    setState(() {
      reports.add({
        "title": title,
        "description": description,
        "date": DateTime.now().toLocal().toString().split(' ')[0], // Current Date
        "image": image
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10), // Adds spacing to the button
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportIssuePage(onSubmit: _submitReport),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              ),
              child: Text(
                "Report an Issue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search reports...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: reports.length,
              itemBuilder: (context, index) {
                return reportCard(
                  reports[index]["title"]!,
                  reports[index]["description"]!,
                  reports[index]["date"]!,
                  reports[index]["image"]!,
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget reportCard(String title, String description, String date, String image, BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$description\n$date"),
        onTap: () {
          // Navigate to the Detailed Report Page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailedReportPage(
                title: title,
                description: description,
                date: date,
                image: image,
              ),
            ),
          );
        },
      ),
    );
  }
}
