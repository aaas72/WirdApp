import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/wird_provider.dart';
import '../../domain/entities/wird.dart';

class FlowScreen extends ConsumerStatefulWidget {
  final Wird? initialWird;
  const FlowScreen({super.key, this.initialWird});

  @override
  ConsumerState<FlowScreen> createState() => _FlowScreenState();
}

class _FlowScreenState extends ConsumerState<FlowScreen> {
  int _currentCount = 0;
  late Wird _currentWird;

  @override
  Widget build(BuildContext context) {
    final wirds = ref.watch(wirdListProvider);
    if (wirds.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    
    _currentWird = widget.initialWird ?? wirds.first;
    
    final progress = _currentWird.targetCount > 1 ? _currentCount / _currentWird.targetCount : 1.0;
    final isAction = _currentWird.type == WirdType.action || _currentWird.targetCount == 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('التدفق والإنجاز'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.silverGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _currentWird.frequency == WirdFrequency.daily 
                      ? 'الأنشطة اليومية' 
                      : _currentWird.frequency == WirdFrequency.weekly ? 'الأنشطة الأسبوعية' : 'الأنشطة الشهرية',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 48),
                Expanded(
                  child: Center(
                    child: GlassContainer(
                      width: double.infinity,
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _currentWird.text,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              height: 1.5,
                              color: AppColors.primaryDark,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            isAction ? "عمل لمرة واحدة" : "تكرار مستمر",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 64),
                // Render Action Button or Circular Progress
                isAction
                    ? ElevatedButton.icon(
                        onPressed: () {
                          ref.read(completedWirdsProvider.notifier).complete(_currentWird.id);
                          Navigator.pop(context); // Mock complete and go back
                        },
                        icon: const Icon(Icons.check_circle_outline, size: 28),
                        label: const Text('إتمام النشاط', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_currentCount < _currentWird.targetCount - 1) {
                              _currentCount++;
                            } else {
                              _currentCount++;
                              ref.read(completedWirdsProvider.notifier).complete(_currentWird.id);
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 8,
                                backgroundColor: AppColors.silverBorder.withOpacity(0.5),
                                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                              ),
                            ),
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.surface,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.silverDark.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '$_currentCount',
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: AppColors.primaryDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'الرجوع للقائمة',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
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
