import 'package:flutter/material.dart';
import 'news_detail_page.dart';

class NewsPage extends StatelessWidget {
  final List<Map<String, String>> newsList = [
    {
      "title": "Amazon Rainforest Fires",
      "date": "March 19, 2025",
      "image": "lib/images/image1.jpg",
      "description": "Massive fires are spreading across the Amazon...",
      "content": "The Amazon rainforest is experiencing one of the worst fire seasons..."
    },
    {
      "title": "Renewable Energy Growth",
      "date": "March 18, 2025",
      "image": "lib/images/image2.jpg",
      "description": "Solar energy adoption has increased significantly...",
      "content": "Global investments in renewable energy have reached an all-time high..."
    },
    {
      "title": "Ocean Cleanup Project",
      "date": "March 17, 2025",
      "image": "lib/images/image3.jpg",
      "description": "A new initiative to clean the ocean...",
      "content": "Scientists have developed an advanced system to remove plastic waste..."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          final news = newsList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: news),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(news["image"]!, fit: BoxFit.cover, height: 200, width: double.infinity),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(news["title"]!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text(news["date"]!, style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 8),
                        Text(news["description"]!, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
