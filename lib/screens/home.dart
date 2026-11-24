import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets.dart';
import 'workout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      eyebrow: 'ยินดีต้อนรับ',
      title: 'พร้อมขยับหรือยัง?',
      children: [
        InfoCard(
          color: AppColors.primary,
          padding: const EdgeInsets.all(20),
          child: Row(children: [
            const Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('แต้มที่มีอยู่',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
                Text('120',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.w800)),
                Text('แต้มสะสม',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ]),
            ),
            // TODO: แทนด้วย Image.asset('assets/images/mascot.png')
            const MascotPlaceholder(size: 84),
          ]),
        ),
        PrimaryButton('เริ่มออกกำลังกาย  →',
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ExerciseSelectScreen()))),
        const SizedBox(height: 12),
        InfoCard(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const LevelScreen())),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text('เลเวล 1', style: TextStyle(fontWeight: FontWeight.w800)),
              Spacer(),
              Text('70 / 100 XP',
                  style: TextStyle(fontSize: 12, color: AppColors.muted)),
            ]),
            SizedBox(height: 8),
            ProgressBarX(0.7),
          ]),
        ),
        const SizedBox(height: 4),
        const Text('ภารกิจวันนี้',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        const InfoCard(
          color: Color(0xFFDCE3C8),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('กระโดดตบให้ครบ 30 ครั้ง',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                SizedBox(height: 2),
                Text('ความคืบหน้า 0/30',
                    style: TextStyle(fontSize: 11, color: AppColors.muted)),
              ]),
            ),
            Icon(Icons.arrow_forward, size: 18),
          ]),
        ),
      ],
    );
  }
}

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      eyebrow: 'ความคืบหน้า',
      title: 'เลเวลของฉัน',
      showBack: true,
      children: [
        InfoCard(
          color: AppColors.slate,
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('LEVEL',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.muted)),
            const SizedBox(height: 8),
            const Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('1',
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.w800)),
              Spacer(),
              Text('70 / 100 XP',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            ]),
            const SizedBox(height: 8),
            const ProgressBarX(0.7),
          ]),
        ),
        const SizedBox(height: 12),
        const Text('รางวัลเลเวลถัดไป',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        const Text('+40 แต้ม เมื่อถึงเลเวล 2',
            style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.primary)),
        const SizedBox(height: 6),
        const Text('! ทุก 1 ครั้งที่บันทึก ได้ 1 XP และ 1 แต้ม',
            style: TextStyle(fontSize: 11, color: AppColors.muted)),
        const Text('! XP ที่ต้องใช้จะเพิ่มมากขึ้นในแต่ละเลเวล',
            style: TextStyle(fontSize: 11, color: AppColors.muted)),
        const SizedBox(height: 40),
        PrimaryButton('ไปออกกำลังกาย',
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ExerciseSelectScreen()))),
      ],
    );
  }
}