import 'package:flutter/material.dart';

import '../app/bottom_nav.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _messages = <_Msg>[
    const _Msg('오늘 요약 알려줘', true),
    const _Msg('100–300자 카드입니다. 핵심만 압축해 드릴게요.', false),
  ];

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_Msg(text, true));
      _controller.clear();
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      setState(() {
        _messages.add(const _Msg('더미 응답: 카드를 생성했습니다.', false));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppShell(
      index: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('채팅')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _messages.length,
                itemBuilder: (_, index) {
                  final message = _messages[index];
                  final alignment =
                      message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
                  final bubbleColor = message.isMe
                      ? Theme.of(context).colorScheme.primary.withOpacity(.12)
                      : Colors.white;

                  return Column(
                    crossAxisAlignment: alignment,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: bubbleColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(message.text),
                      ),
                    ],
                  );
                },
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(hintText: '메시지 입력'),
                        onSubmitted: (_) => _send(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(onPressed: _send, child: const Text('전송')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Msg {
  final String text;
  final bool isMe;

  const _Msg(this.text, this.isMe);
}
