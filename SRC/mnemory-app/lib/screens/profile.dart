import "package:flutter/material.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 정보')),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('게스트 사용자'),
            subtitle: Text('로그인하면 학습이 이어집니다'),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('푸시 알림'),
            value: true,
            onChanged: (_) {},
          ),
          ListTile(
            title: const Text('학습 시간대'),
            subtitle: const Text('08:00–18:00 · 매시간 1회'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text('개인정보'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text('약관 및 정책'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
