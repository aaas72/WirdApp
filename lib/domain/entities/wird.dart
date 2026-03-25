import 'package:hive/hive.dart';

part 'wird.g.dart';

@HiveType(typeId: 0)
enum WirdType {
  @HiveField(0) dhikr,
  @HiveField(1) dua,
  @HiveField(2) recitation,
  @HiveField(3) tasbih,
  @HiveField(4) action,
}

@HiveType(typeId: 1)
enum WirdSession {
  @HiveField(0) fajr,
  @HiveField(1) morning,
  @HiveField(2) dhuha,
  @HiveField(3) duhr,
  @HiveField(4) maghrib,
  @HiveField(5) isha,
  @HiveField(6) sleep,
}

@HiveType(typeId: 2)
enum WirdPriority {
  @HiveField(0) obligatory,
  @HiveField(1) sunnah,
  @HiveField(2) nafl,
}

@HiveType(typeId: 5)
enum WirdFrequency {
  @HiveField(0) daily,
  @HiveField(1) weekly,
  @HiveField(2) monthly,
}

@HiveType(typeId: 3)
class Wird extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String text;
  
  @HiveField(2)
  final String? transliteration;
  
  @HiveField(3)
  final String? meaning;
  
  @HiveField(4)
  final String? source;
  
  @HiveField(5)
  final WirdType type;
  
  @HiveField(6)
  final WirdSession session;
  
  @HiveField(7)
  final int targetCount;
  
  @HiveField(8)
  final WirdPriority priority;
  
  @HiveField(9)
  final bool isCustom;
  
  @HiveField(10)
  final int sortOrder;
  
  @HiveField(11)
  final WirdFrequency frequency;

  Wird({
    required this.id,
    required this.text,
    this.transliteration,
    this.meaning,
    this.source,
    required this.type,
    required this.session,
    required this.targetCount,
    required this.priority,
    this.isCustom = false,
    this.sortOrder = 0,
    this.frequency = WirdFrequency.daily,
  });
}
