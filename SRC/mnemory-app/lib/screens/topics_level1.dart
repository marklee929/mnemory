import 'package:flutter/material.dart';

import '../app/bottom_nav.dart';

class TopicsLevel1Screen extends StatelessWidget {
  const TopicsLevel1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = {
      '영어': ['회화', '의학', '발표'],
      '철학': ['윤리학', '존재론', '인식론'],
      '경제': ['거시', '미시', '금융'],
    };

    return AppShell(
      index: 1,
      child: Scaffold(
        appBar: AppBar(title: const Text('학습 목록 (1단계)')),
        body: ListView(
          children: topics.entries
              .map(
                (entry) => ExpansionTile(
                  title: Text(entry.key),
                  children: entry.value
                      .map(
                        (lv2) => ListTile(
                          title: Text(lv2),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/topics/2',
                            arguments: {'lv1': entry.key, 'lv2': lv2},
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
