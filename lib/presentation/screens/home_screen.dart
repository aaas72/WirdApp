import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass_container.dart';
import '../providers/wird_provider.dart';
import '../../domain/entities/wird.dart';
import 'flow_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const currentSessionName = 'فترة الصباح';
    
    final wirds = ref.watch(wirdListProvider).where((w) => w.frequency == WirdFrequency.daily).toList();
    final completedIds = ref.watch(completedWirdsProvider);
    
    final uncompletedWirds = wirds.where((w) => !completedIds.contains(w.id)).toList();
    final sessionProgress = wirds.isEmpty ? 0.0 : completedIds.length / wirds.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة التركيز', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.silverGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.orange.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🔥', style: TextStyle(fontSize: 28)),
                        const SizedBox(width: 12),
                        Text(
                          '12 يوماً من المواظبة!',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.orange.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Expanded(
                  child: GlassContainer(
                    padding: const EdgeInsets.all(32),
                    opacity: 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentSessionName,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 180,
                              height: 180,
                              child: CircularProgressIndicator(
                                value: sessionProgress,
                                strokeWidth: 14,
                                backgroundColor: AppColors.silverBorder,
                                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${(sessionProgress * 100).toInt()}%',
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryDark,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'مكتمل',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 64),
                        ElevatedButton(
                          onPressed: () {
                            if (uncompletedWirds.isNotEmpty) {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => FlowScreen(initialWird: uncompletedWirds.first)));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم إنجاز أوراد هذه الفترة بنجاح! 🎉')));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: uncompletedWirds.isNotEmpty ? AppColors.primary : Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            elevation: 8,
                            shadowColor: AppColors.primary.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                uncompletedWirds.isNotEmpty ? 'ابدأ رحلة الإنجاز الآن' : 'تم الإنجاز بالكامل',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              if (uncompletedWirds.isNotEmpty) ...[
                                const SizedBox(width: 12),
                                const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
