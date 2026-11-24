import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets.dart';
import 'workout.dart';

class MissionsScreen extends StatelessWidget {
  const MissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void go() => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ExerciseSelectScreen()));

    return AppScreen(
      eyebrow: 'ยินดีต้อนรับ',
      title: 'ภารกิจประจำวัน',
      children: [
        _MissionCard(
            color: AppColors.olive,
            tag: 'เริ่มต้น',
            title: 'เริ่มขยับ',
            progress: 0.0,
            progressText: '0/1',
            points: '+10 แต้ม',
            onGo: go),
        _MissionCard(
            color: AppColors.slate,
            tag: 'กระโดดตบ',
            title: 'กระโดดตบให้ครบ 30 ครั้ง',
            progress: 0.0,
            progressText: '0/30',
            points: '+25 แต้ม',
            onGo: go),
        _MissionCard(
            color: AppColors.slate,
            tag: 'ต่อเนื่อง',
            title: 'ออกครบ 10 นาที',
            progress: 0.0,
            progressText: '0/10',
            points: '+30 แต้ม',
            onGo: go),
      ],
    );
  }
}

class _MissionCard extends StatelessWidget {
  final Color color;
  final String tag, title, progressText, points;
  final double progress;
  final VoidCallback onGo;
  const _MissionCard({
    required this.color,
    required this.tag,
    required this.title,
    required this.progress,
    required this.progressText,
    required this.points,
    required this.onGo,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      color: color,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(tag, style: const TextStyle(fontSize: 11)),
          const Spacer(),
          Text(points,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: 4),
        Text(title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        ProgressBarX(progress),
        const SizedBox(height: 8),
        Row(children: [
          Text(progressText, style: const TextStyle(fontSize: 11)),
          const Spacer(),
          FilledButton(
            onPressed: onGo,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('ไปเลย →', style: TextStyle(fontSize: 12)),
          ),
        ]),
      ]),
    );
  }
}

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  static const _rows = [
    ('01', 'พี่ลีโอ', '420 แต้ม'),
    ('02', 'โหยกกก', '270 แต้ม'),
    ('03', 'เนี้ยบ', '185 แต้ม'),
    ('04', 'คุณ', '120 แต้ม'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      eyebrow: 'เปรียบเทียบกับเพื่อน',
      title: 'กระดานอันดับ',
      children: [
        const InfoCard(
          color: AppColors.primary,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('รอบเดือน พฤศจิกายน 2569',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w800)),
            SizedBox(height: 2),
            Text('คะแนนจะรีเซ็ตทุกต้นเดือน',
                style: TextStyle(color: Colors.white70, fontSize: 11)),
          ]),
        ),
        for (final r in _rows)
          InfoCard(
            color: r.$2 == 'คุณ' ? AppColors.olive : Colors.white,
            child: Row(children: [
              Text(r.$1,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, color: AppColors.muted)),
              const SizedBox(width: 14),
              Text(r.$2, style: const TextStyle(fontWeight: FontWeight.w700)),
              const Spacer(),
              Text(r.$3,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700)),
            ]),
          ),
      ],
    );
  }
}

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      eyebrow: 'แลกของรางวัล',
      title: 'แลกส่วนลดฟิตเนส',
      children: [
        const InfoCard(
          color: AppColors.primary,
          padding: EdgeInsets.all(18),
          child: Row(children: [
            Text('แต้มของฉัน',
                style: TextStyle(color: Colors.white, fontSize: 13)),
            Spacer(),
            Text('120 แต้ม',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800)),
          ]),
        ),
        const _Coupon(
            color: AppColors.olive, percent: '10%', cost: 100),
        const _Coupon(
            color: AppColors.slate, percent: '20%', cost: 220),
        const SizedBox(height: 4),
        const Text('คูปองของฉัน: 0',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
      ],
    );
  }
}

class _Coupon extends StatelessWidget {
  final Color color;
  final String percent;
  final int cost;
  const _Coupon({required this.color, required this.percent, required this.cost});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      color: color,
      padding: const EdgeInsets.all(18),
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('ส่วนลดฟิตเนส', style: TextStyle(fontSize: 11)),
            Text(percent,
                style: const TextStyle(
                    fontSize: 32, fontWeight: FontWeight.w800)),
          ]),
        ),
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text('แลก $cost แต้ม', style: const TextStyle(fontSize: 12)),
        ),
      ]),
    );
  }
}