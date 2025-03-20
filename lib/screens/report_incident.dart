import 'package:flutter/material.dart';

class ReportIssuePage extends StatefulWidget {
  final Function(String, String, String) onSubmit;
  ReportIssuePage({required this.onSubmit});

  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedImage = "lib/images/image1.jpg"; // Placeholder image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report Issue")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Illegal Dumping at Park",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Image.asset(_selectedImage, width: double.infinity, height: 150, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _selectedImage = "lib/images/image1.jpg"),
                  child: Text("Take Photo"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _selectedImage = "lib/images/image2.jpg"),
                  child: Text("Choose from Gallery"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text("Automatic Location Detection: 123 Park St."),
                  SizedBox(height: 5),
                  Image.asset("lib/images/static_map.png", height: 100, fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Please briefly describe the illegal dumping.",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              // child: Padding(
                // padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 80.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
                      widget.onSubmit(
                        _titleController.text,
                        _descriptionController.text,
                        _selectedImage,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Submit Report", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              )
            // )
          ],
        ),
      ),
    );
  }
}
