import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/glass_container.dart';
import '../providers/wird_provider.dart';
import '../../domain/entities/wird.dart';

class TrackerScreen extends ConsumerWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('سجل المتابعة', style: TextStyle(fontWeight: FontWeight.bold)),
          elevation: 0,
          bottom: const TabBar(
            labelColor: AppColors.primaryDark,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: 'اليومي'),
              Tab(text: 'الأسبوعي'),
              Tab(text: 'الشهري'),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(gradient: AppColors.silverGradient),
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: GlassContainer(
                padding: EdgeInsets.all(4),
                opacity: 0.8,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _TrackerTable(freq: WirdFrequency.daily, title: 'النشاط اليومي', headers: ['اليوم'], count: 1),
                    _TrackerTable(freq: WirdFrequency.weekly, title: 'النشاط الأسبوعي', headers: ['هذا الأسبوع'], count: 1),
                    _TrackerTable(freq: WirdFrequency.monthly, title: 'النشاط الشهري', headers: ['هذا الشهر'], count: 1),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TrackerTable extends ConsumerWidget {
  final WirdFrequency freq;
  final String title;
  final List<String> headers;
  final int count;

  const _TrackerTable({required this.freq, required this.title, required this.headers, required this.count});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wirds = ref.watch(wirdListProvider).where((w) => w.frequency == freq).toList();
    final trackingState = ref.watch(trackingStateProvider);

    if (wirds.isEmpty) {
      return const Center(child: Text('لا توجد بيانات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.grey.withOpacity(0.2),
                ),
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(AppColors.primary.withOpacity(0.12)),
                  dataRowMinHeight: 50,
                  dataRowMaxHeight: 65,
                  columnSpacing: 16,
                  horizontalMargin: 12,
                  border: TableBorder(
                    horizontalInside: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  columns: [
                    const DataColumn(label: Text('م', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primaryDark))),
                    DataColumn(label: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primaryDark))),
                    ...headers.map((e) => DataColumn(label: Center(child: Text(e, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.primaryDark))))),
                  ],
                  rows: List.generate(wirds.length, (index) {
                    final w = wirds[index];
                    final rowChecks = trackingState[w.id] ?? List.filled(count, false);

                    return DataRow(
                      color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                        return index.isEven ? Colors.transparent : const Color(0xFFF8F9FA); // Zebra
                      }),
                      cells: [
                        DataCell(Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                        DataCell(SizedBox(
                          width: constraints.maxWidth * 0.55, 
                          child: Text(w.text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, height: 1.4, color: AppColors.textPrimary)),
                        )),
                        ...List.generate(count, (colIdx) {
                          return DataCell(
                            Center(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => ref.read(trackingStateProvider.notifier).toggle(w.id, colIdx, count),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    rowChecks[colIdx] ? Icons.check_circle : Icons.circle_outlined,
                                    color: rowChecks[colIdx] ? const Color(0xFF4CAF50) : Colors.grey.shade400,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
