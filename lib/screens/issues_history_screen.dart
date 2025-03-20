import 'package:flutter/material.dart';

class IssuesHistoryScreen extends StatelessWidget {
  const IssuesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issues History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search incidents...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  hint: const Text('Incident Type'),
                  items: ['All', 'Resolved', 'Pending'].map((type) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
                  onChanged: (value) {},
                ),
                DropdownButton(
                  hint: const Text('Date Range'),
                  items: ['Last Week', 'Last Month', 'Last Year'].map((date) {
                    return DropdownMenuItem(value: date, child: Text(date));
                  }).toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: List.generate(5, (index) {
                  return Card(
                    child: ListTile(
                      title: Text('Issue ${index + 1}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Status: Resolved'),
                          Text('Date: 10/20/2023'),
                          const SizedBox(height: 5),
                          Row(
                            children: List.generate(4, (i) {
                              return const Icon(Icons.star, color: Colors.amber, size: 16);
                            }),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.image),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
