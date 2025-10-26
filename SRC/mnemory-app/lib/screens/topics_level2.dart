import 'package:flutter/material.dart';

import '../app/bottom_nav.dart';

class TopicsLevel2Screen extends StatelessWidget {
  const TopicsLevel2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    final lv1 = args?['lv1'] ?? '';
    final lv2 = args?['lv2'] ?? '';

    final lv3s = (lv2 == '의학')
        ? ['척추', '치과', '응급']
        : (lv2 == '회화')
            ? ['일상', '서비스', '관광']
            : ['개요', '심화', '기출'];

    return AppShell(
      index: 1,
      child: Scaffold(
        appBar: AppBar(title: Text('$lv1 > $lv2')),
        body: ListView.builder(
          itemCount: lv3s.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(lv3s[i]),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(
              context,
              '/topics/3',
              arguments: {
                'lv1': lv1,
                'lv2': lv2,
                'lv3': lv3s[i],
              },
            ),
          ),
        ),
      ),
    );
  }
}
