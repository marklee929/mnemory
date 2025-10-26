import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../app/bottom_nav.dart';
import '../widgets/learning_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Map<String, dynamic>>> _load() async {
    try {
      final text = await rootBundle.loadString('assets/mock/cards_today.json');
      final data = jsonDecode(text)['cards'] as List<dynamic>;
      return data.cast<Map<String, dynamic>>();
    } catch (_) {
      return [
        {
          'title': '예시 학습 카드',
          'summary': '100–300자 요약 더미입니다. 난이도 버튼으로 간격을 조정할 수 있습니다.',
          'bullets': ['핵심 포인트 A', '핵심 포인트 B', '핵심 포인트 C'],
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      index: 0,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            centerTitle: true,
            title: Hero(
              tag: 'app_logo',
              child: Image.asset(
                'assets/logo-transparent.png',
                height: 28,
                fit: BoxFit.contain,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                icon: const Icon(Icons.settings_outlined),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '반가워요! 주제를 고르면 요약 카드가 도착합니다.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      FilledButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/topics'),
                        child: const Text('주제 선택'),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('루틴 설정'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _load(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final cards = snapshot.data!;
                return Column(
                  children: cards
                      .map(
                        (card) => LearningCard(
                          title: card['title'] as String,
                          summary: card['summary'] as String,
                          bullets:
                              (card['bullets'] as List<dynamic>).cast<String>(),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
