import 'package:flutter/material.dart';
import '../theme.dart';
import 'home.dart';
import 'tabs.dart';

/// หน้าหลักที่มีแถบเมนูล่าง 4 แท็บ: หน้าหลัก / ภารกิจ / อันดับ / รางวัล
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const _pages = <Widget>[
    HomeScreen(),
    MissionsScreen(),
    LeaderboardScreen(),
    RewardsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.bg,
        height: 64,
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'หน้าหลัก'),
          NavigationDestination(icon: Icon(Icons.task_alt), label: 'ภารกิจ'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'อันดับ'),
          NavigationDestination(icon: Icon(Icons.card_giftcard), label: 'รางวัล'),
        ],
      ),
    );
  }
}