import 'package:flutter/material.dart';
import 'theme.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Transform(
        transform: Matrix4.skewX(-0.35),
        child: Container(
          width: 10,
          height: 18,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary, width: 2),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      const SizedBox(width: 8),
      const Text('Overcise',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.navy)),
    ]);
  }
}

/// โครงหน้าทั่วไป: โลโก้ + (ปุ่มกลับ) + หัวข้อ + เนื้อหา
class AppScreen extends StatelessWidget {
  final String? eyebrow;
  final String title;
  final bool showBack;
  final List<Widget> children;

  const AppScreen({
    super.key,
    required this.title,
    required this.children,
    this.eyebrow,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            Row(children: [
              const AppLogo(),
              const Spacer(),
              if (showBack)
                GestureDetector(
                  onTap: () => Navigator.of(context).maybePop(),
                  child: const Text('← กลับ',
                      style: TextStyle(fontSize: 12, color: AppColors.muted)),
                ),
            ]),
            const SizedBox(height: 14),
            if (eyebrow != null)
              Text(eyebrow!,
                  style: const TextStyle(fontSize: 11, color: AppColors.muted)),
            Text(title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const InfoCard({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const PrimaryButton(this.label, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
      ),
    );
  }
}

class OutlineActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const OutlineActionButton(this.label, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
      ),
    );
  }
}

class LabeledField extends StatelessWidget {
  final String label;
  final String hint;
  final bool password;
  final TextEditingController? controller;

  const LabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.password = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      const SizedBox(height: 6),
      password
          ? _PasswordInput(hint: hint, controller: controller)
          : TextField(
              controller: controller,
              decoration: InputDecoration(hintText: hint),
            ),
      const SizedBox(height: 14),
    ]);
  }
}

class _PasswordInput extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  const _PasswordInput({required this.hint, this.controller});

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _hidden,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: TextButton(
          onPressed: () => setState(() => _hidden = !_hidden),
          child: Text(_hidden ? 'Show' : 'Hide',
              style: const TextStyle(fontSize: 11, color: AppColors.primary)),
        ),
      ),
    );
  }
}

class ProgressBarX extends StatelessWidget {
  final double value;
  const ProgressBarX(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 6,
        backgroundColor: Colors.white,
        color: AppColors.primary,
      ),
    );
  }
}

/// ที่เว้นไว้สำหรับรูปมาสคอต/ภาพประกอบ — แทนด้วย Image.asset เมื่อ export จาก Figma แล้ว
class MascotPlaceholder extends StatelessWidget {
  final double size;
  final IconData icon;
  const MascotPlaceholder({super.key, this.size = 72, this.icon = Icons.directions_run});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
          color: Color(0x3300FFFF), shape: BoxShape.circle),
      child: Icon(icon, size: size * 0.55, color: const Color(0xFF7FE0D0)),
    );
  }
}