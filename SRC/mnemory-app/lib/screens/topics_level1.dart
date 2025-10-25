import 'package:flutter/material.dart';

class TopicsLevel1Screen extends StatelessWidget {
  const TopicsLevel1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Topics L1')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (_, index) => Card(
          child: ListTile(
            title: Text('Level 1 Topic #${index + 1}'),
            subtitle: const Text('Summary placeholder'),
          ),
        ),
      ),
    );
  }
}
