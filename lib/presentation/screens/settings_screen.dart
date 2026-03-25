import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.silverGradient,
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              GlassContainer(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.notifications, color: AppColors.primary),
                      title: const Text('التذكيرات الذكية'),
                      trailing: Switch(value: true, onChanged: (_) {}, activeColor: AppColors.primary),
                    ),
                    const Divider(color: AppColors.silverBorder),
                    ListTile(
                      leading: const Icon(Icons.mode_night, color: AppColors.primary),
                      title: const Text('الوضع الليلي'),
                      trailing: Switch(value: false, onChanged: (_) {}, activeColor: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GlassContainer(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.edit_document, color: AppColors.primaryDark),
                      title: const Text('تخصيص الأوراد'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                    const Divider(color: AppColors.silverBorder),
                    ListTile(
                      leading: const Icon(Icons.backup, color: AppColors.primaryDark),
                      title: const Text('النسخ الاحتياطي'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
