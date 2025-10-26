import 'package:flutter/material.dart';

import '../app/bottom_nav.dart';

class TopicsLevel3Screen extends StatelessWidget {
  const TopicsLevel3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    final title = [args?['lv1'], args?['lv2'], args?['lv3']]
        .whereType<String>()
        .where((value) => value.isNotEmpty)
        .join(' > ');

    return AppShell(
      index: 1,
      child: Scaffold(
        appBar: AppBar(title: Text(title.isEmpty ? '세부 주제' : title)),
        body: ListView(
          children: List.generate(
            8,
            (i) => ListTile(
              title: Text('세부 주제 ${i + 1}'),
              subtitle: const Text('여기를 시작 카드로 삼을 수 있어요'),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
