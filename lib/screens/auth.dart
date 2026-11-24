import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets.dart';
import 'shell.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // TODO: แทนด้วยภาพพื้นหลังยิม: DecorationImage(image: AssetImage('assets/images/start_bg.png'), fit: BoxFit.cover)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB9C4CC), Color(0xFF8A969E)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                Container(width: 28, height: 4, color: AppColors.accent),
                const SizedBox(height: 12),
                const Text('OVER\nCISE.',
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        color: Colors.black)),
                const Spacer(),
                Center(
                  child: SizedBox(
                    width: 220,
                    height: 48,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF5B9BD5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SignInScreen())),
                      child: const Text('Get Started',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w800)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  const _AuthHeader(this.title, [this.subtitle]);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('OVERCISE.',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.primary)),
      const SizedBox(height: 4),
      Container(width: 28, height: 4, color: AppColors.accent),
      const SizedBox(height: 20),
      Text(title,
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.w800, height: 1.2)),
      if (subtitle != null) ...[
        const SizedBox(height: 6),
        Text(subtitle!,
            style: const TextStyle(fontSize: 12, color: AppColors.muted)),
      ],
      const SizedBox(height: 20),
    ]);
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _AuthHeader('Happy to see you again!',
                          'Sign in to pick up where you left off.'),
                      const LabeledField(
                          label: 'Gmail', hint: 'overcise@example.com'),
                      const LabeledField(
                          label: 'Password',
                          hint: 'กรุณาใส่รหัสผ่าน',
                          password: true),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text('ลืมรหัสผ่าน?',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary)),
                      ),
                      const SizedBox(height: 16),
                      PrimaryButton('Sign in',
                          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const MainShell()),
                              (r) => false)),
                      const SizedBox(height: 16),
                      const Center(
                        child: Text('ข้อมูลของคุณถูกเก็บเป็นความลับและปลอดภัย',
                            style: TextStyle(
                                fontSize: 11, color: AppColors.muted)),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignUpScreen())),
                  child: const Text.rich(TextSpan(
                    text: 'ไม่มีบัญชี?  ',
                    style: TextStyle(fontSize: 12, color: AppColors.muted),
                    children: [
                      TextSpan(
                          text: 'สร้างบัญชี',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary)),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _AuthHeader('Create your Account.',
                          'สร้างบัญชีของคุณเพื่อเริ่มใช้งาน'),
                      const LabeledField(label: 'User Name', hint: 'ชื่อของคุณ'),
                      const LabeledField(
                          label: 'Gmail', hint: 'overcise@example.com'),
                      const LabeledField(
                          label: 'Password',
                          hint: 'กรุณาใส่รหัสผ่าน',
                          password: true),
                      const Text('รหัสผ่านควรมีอย่างน้อย 8 ตัว',
                          style:
                              TextStyle(fontSize: 11, color: AppColors.muted)),
                      const SizedBox(height: 16),
                      PrimaryButton('สร้างบัญชี',
                          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const MainShell()),
                              (r) => false)),
                      const SizedBox(height: 14),
                      const Center(
                        child: Text(
                          'การสร้างบัญชีถือว่าคุณยอมรับข้อกำหนดการให้บริการ\nและนโยบายความเป็นส่วนตัวของเรา',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: AppColors.muted),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text.rich(TextSpan(
                    text: 'มีบัญชีแล้ว?  ',
                    style: TextStyle(fontSize: 12, color: AppColors.muted),
                    children: [
                      TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary)),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}