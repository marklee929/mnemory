import 'package:flutter/material.dart';

import '../app/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _topicCtrl = TextEditingController();
  String _difficulty = '보통';
  String _period = '60';

  @override
  void dispose() {
    _topicCtrl.dispose();
    super.dispose();
  }

  void _start() {
    final topic = _topicCtrl.text.trim();
    if (topic.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('학습 주제를 입력해 주세요')),
      );
      return;
    }
    debugPrint('start topic="$topic", diff=$_difficulty, period=$_period');
    // Navigator.pushNamed(context, '/topics');
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AppShell(
      index: 0,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            centerTitle: true,
            title: Hero(
              tag: 'app_logo',
              child: Image.asset(
                'assets/logo-transparent.png',
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            actions: [
              IconButton(
                tooltip: '설정',
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                icon: const Icon(Icons.settings_outlined),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Row(
                children: [
                  Expanded(
                    child: _PillSelector(
                      title: '',
                      options: const [
                        _PillOption(value: '쉬움', label: '쉬움'),
                        _PillOption(value: '보통', label: '보통'),
                        _PillOption(value: '어려움', label: '어려움'),
                      ],
                      selected: _difficulty,
                      onChanged: (value) => setState(() => _difficulty = value),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _PillSelector(
                      title: '',
                      options: const [
                        _PillOption(value: '30', label: '30일'),
                        _PillOption(value: '60', label: '60일'),
                        _PillOption(value: '90', label: '90일'),
                      ],
                      selected: _period,
                      onChanged: (value) => setState(() => _period = value),
                      alignEnd: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: const Alignment(0, -0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 880),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '무엇을 배우고 싶으신가요?',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Image.asset(
                        'assets/logo-transparent.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 16),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _topicCtrl,
                                onSubmitted: (_) => _start(),
                                decoration: InputDecoration(
                                  hintText: '예: 영어 회화, 윤리학, 거시경제…',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              height: 46,
                              child: FilledButton(
                                onPressed: _start,
                                child: const Icon(Icons.arrow_forward_rounded),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PillSelector extends StatelessWidget {
  final String title;
  final List<_PillOption> options;
  final String selected;
  final ValueChanged<String> onChanged;
  final bool alignEnd;

  const _PillSelector({
    required this.title,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    final children = options.map((option) {
      final isSelected = option.value == selected;
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => onChanged(option.value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? const Color(0xFFE7E0FF) : Colors.transparent,
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF5C47C3)
                  : const Color(0xFFE0E0E0),
            ),
            boxShadow: isSelected
                ? const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 6,
                      offset: Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: Text(
            option.label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected
                  ? const Color(0xFF5C47C3)
                  : const Color(0xFF4E5968),
            ),
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        Wrap(
          alignment: alignEnd ? WrapAlignment.end : WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: children,
        ),
      ],
    );
  }
}

class _PillOption {
  final String value;
  final String label;

  const _PillOption({required this.value, required this.label});
}
