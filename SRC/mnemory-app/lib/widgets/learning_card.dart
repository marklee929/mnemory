import 'package:flutter/material.dart';

class LearningCard extends StatelessWidget {
  final String title;
  final String summary;
  final List<String> bullets;

  const LearningCard({
    super.key,
    required this.title,
    required this.summary,
    required this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: cs.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(summary),
            const SizedBox(height: 8),
            ...bullets.map(
              (b) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• '),
                  Expanded(child: Text(b)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                FilledButton.tonal(onPressed: () {}, child: const Text('쉬움')),
                const SizedBox(width: 8),
                FilledButton.tonal(onPressed: () {}, child: const Text('보통')),
                const SizedBox(width: 8),
                FilledButton.tonal(onPressed: () {}, child: const Text('어려움')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
