import 'dart:async';
import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets.dart';

class ExerciseSelectScreen extends StatelessWidget {
  const ExerciseSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      eyebrow: 'ออกกำลังกาย',
      title: 'เลือกท่าของวันนี้',
      showBack: true,
      children: [
        _ExerciseCard(
          color: AppColors.olive,
          name: 'กระโดดตบ',
          desc: 'คาร์ดิโอพื้นฐาน',
          icon: Icons.directions_run,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const ExerciseGuideScreen(name: 'กระโดดตบ'))),
        ),
        _ExerciseCard(
          color: AppColors.slate,
          name: 'Sit up',
          desc: 'เสริมกล้ามท้อง',
          icon: Icons.self_improvement,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const ExerciseGuideScreen(name: 'Sit up'))),
        ),
      ],
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final Color color;
  final String name, desc;
  final IconData icon;
  final VoidCallback onTap;
  const _ExerciseCard({
    required this.color,
    required this.name,
    required this.desc,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      color: color,
      onTap: onTap,
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 110,
        child: Row(children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w800)),
                Text(desc, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          // TODO: แทนด้วยรูปท่าจาก Figma
          MascotPlaceholder(size: 80, icon: icon),
        ]),
      ),
    );
  }
}

class ExerciseGuideScreen extends StatelessWidget {
  final String name;
  const ExerciseGuideScreen({super.key, required this.name});

  static const _steps = [
    'ยืนตรง เท้าชิด แขนแนบลำตัว',
    'กระโดดพร้อมกางขาออกและยกแขนขึ้นเหนือศีรษะ',
    'กระโดดกลับสู่ท่าเริ่มต้น',
    'ทำต่อเนื่องเป็นจังหวะ หายใจสม่ำเสมอ',
  ];

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      eyebrow: 'วิธีฝึก',
      title: name,
      showBack: true,
      children: [
        const InfoCard(
          color: AppColors.slate,
          padding: EdgeInsets.symmetric(vertical: 28),
          child: Center(child: MascotPlaceholder(size: 110)),
        ),
        for (var i = 0; i < _steps.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('${i + 1}. ${_steps[i]}',
                style: const TextStyle(fontSize: 13, height: 1.4)),
          ),
        const SizedBox(height: 20),
        PrimaryButton('ลองเลย',
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => WorkoutScreen(name: name)))),
      ],
    );
  }
}

class WorkoutScreen extends StatefulWidget {
  final String name;
  const WorkoutScreen({super.key, required this.name});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int _count = 0;
  int _seconds = 0;
  Timer? _timer;

  bool get _running => _timer != null;

  void _toggle() {
    if (_running) {
      _timer?.cancel();
      setState(() => _timer = null);
    } else {
      setState(() {
        _timer = Timer.periodic(
            const Duration(seconds: 1), (_) => setState(() => _seconds++));
      });
    }
  }

  void _finish() {
    _timer?.cancel();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => SummaryScreen(
          name: widget.name, reps: _count, seconds: _seconds),
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _time =>
      '${_seconds ~/ 60}:${(_seconds % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      eyebrow: 'กำลังออกกำลังกาย',
      title: widget.name,
      children: [
        // TODO: ต่อกล้อง/ML นับท่า แล้วเรียก setState(() => _count++) ตรงนี้
        const InfoCard(
          color: AppColors.slate,
          padding: EdgeInsets.symmetric(vertical: 44),
          child: Center(
            child: Column(children: [
              Icon(Icons.photo_camera_outlined, size: 32),
              SizedBox(height: 6),
              Text('เปิดกล้องเพื่อนับท่า', style: TextStyle(fontSize: 12)),
            ]),
          ),
        ),
        Row(children: [
          Expanded(child: _Stat('$_count', 'ครั้ง')),
          Expanded(child: _Stat(_time, 'เวลา')),
        ]),
        const SizedBox(height: 16),
        PrimaryButton(_running ? 'หยุดชั่วคราว' : 'เริ่มนับท่า', onPressed: _toggle),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => setState(() => _count++),
          child: const Text('+1 (ปุ่มทดสอบ)', style: TextStyle(fontSize: 12)),
        ),
        OutlineActionButton('จบการฝึก', onPressed: _finish),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final String value, label;
  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(value,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800)),
      Text(label, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
    ]);
  }
}

class SummaryScreen extends StatelessWidget {
  final String name;
  final int reps;
  final int seconds;
  const SummaryScreen({
    super.key,
    required this.name,
    required this.reps,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    final kcal = (reps * 0.5).round();
    final time = '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}';

    return AppScreen(
      title: 'สรุปผล',
      children: [
        InfoCard(
          color: AppColors.olive,
          padding: const EdgeInsets.all(20),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(name, style: const TextStyle(fontSize: 12)),
                Text('+$reps',
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.w800)),
                const Text('แต้มที่ได้', style: TextStyle(fontSize: 12)),
              ]),
            ),
            const MascotPlaceholder(size: 72),
          ]),
        ),
        InfoCard(
          child: Column(children: [
            _Row('จำนวนครั้ง', '$reps ครั้ง'),
            _Row('เวลารวม', time),
            _Row('พลังงานที่เผาผลาญ', '$kcal kcal'),
            _Row('XP ที่ได้', '+$reps XP'),
            _Row('แต้มที่ได้', '+$reps แต้ม'),
          ]),
        ),
        PrimaryButton('ดูภารกิจวันนี้',
            onPressed: () =>
                Navigator.of(context).popUntil((r) => r.isFirst)),
        const SizedBox(height: 10),
        OutlineActionButton('กลับหน้าหลัก',
            onPressed: () =>
                Navigator.of(context).popUntil((r) => r.isFirst)),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  final String label, value;
  const _Row(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.muted)),
        const Spacer(),
        Text(value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}