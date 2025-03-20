import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final Map<String, String> news;

  NewsDetailPage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(news["image"]!, fit: BoxFit.cover, width: double.infinity, height: 250),
              ),
              SizedBox(height: 16),
              Text(news["title"]!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(news["date"]!, style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16),
              Text(news["content"]!, style: TextStyle(fontSize: 16, height: 1.5)),
            ],
          ),
        ),
      ),
    );
  }
}
