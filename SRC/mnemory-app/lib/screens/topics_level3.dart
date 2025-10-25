import 'package:flutter/material.dart';

class TopicsLevel3Screen extends StatelessWidget {
  const TopicsLevel3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Topics L3')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, index) => ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text('Level 3 Topic ${index + 1}'),
          subtitle: const Text('Deep dive placeholder'),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 5,
      ),
    );
  }
}
