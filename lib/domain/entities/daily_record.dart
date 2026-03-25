import 'package:hive/hive.dart';

part 'daily_record.g.dart';

@HiveType(typeId: 4)
class DailyRecord extends HiveObject {
  @HiveField(0)
  final DateTime date;
  
  @HiveField(1)
  final Map<String, int> completions;
  
  @HiveField(2)
  final Map<String, bool> skipped;
  
  @HiveField(3)
  final bool isFullyCompleted;
  
  @HiveField(4)
  final int streakDay;
  
  @HiveField(5)
  final int totalTimeInSeconds;

  DailyRecord({
    required this.date,
    required this.completions,
    required this.skipped,
    this.isFullyCompleted = false,
    this.streakDay = 0,
    this.totalTimeInSeconds = 0,
  });
}
