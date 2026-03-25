import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass_container.dart';
import '../providers/wird_provider.dart';
import '../../domain/entities/wird.dart';
import 'flow_screen.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wirds = ref.watch(wirdListProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الأنشطة والأوراد'),
          bottom: TabBar(
            labelColor: AppColors.primaryDark,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            tabs: const [
              Tab(text: 'يومي 🗓️'),
              Tab(text: 'أسبوعي 📅'),
              Tab(text: 'شهري 📊'),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.silverGradient,
          ),
          child: SafeArea(
            child: TabBarView(
              children: [
                _buildListView(context, wirds.where((w) => w.frequency == WirdFrequency.daily).toList()),
                _buildListView(context, wirds.where((w) => w.frequency == WirdFrequency.weekly).toList()),
                _buildListView(context, wirds.where((w) => w.frequency == WirdFrequency.monthly).toList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<Wird> items) {
    if (items.isEmpty) {
      return const Center(child: Text('لا توجد أنشطة لهذه الفترة'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final wird = items[index];
        return GlassContainer(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => FlowScreen(initialWird: wird)));
          },
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircularProgressIndicator(
                value: 0.0, // Mock status
                backgroundColor: AppColors.silverBorder,
                color: AppColors.primary,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wird.text,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _describeType(wird.type),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_left, color: AppColors.textSecondary),
            ],
          ),
        );
      },
    );
  }

  String _describeType(WirdType type) {
    switch (type) {
      case WirdType.dhikr: return 'ذكر مكرر';
      case WirdType.dua: return 'دعاء ومناجاة';
      case WirdType.recitation: return 'تلاوة مقروءة';
      case WirdType.tasbih: return 'تسبيح وتهليل';
      case WirdType.action: return 'عمل ونشاط';
    }
  }
}
