import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/wird.dart';

final wirdListProvider = StateNotifierProvider<WirdListNotifier, List<Wird>>((ref) {
  return WirdListNotifier();
});

class WirdListNotifier extends StateNotifier<List<Wird>> {
  final Box<Wird> _box = Hive.box<Wird>('wirds_v2');

  WirdListNotifier() : super([]) {
    _loadWirds();
  }

  void _loadWirds() {
    if (_box.isEmpty) {
      final defaultWirds = <Wird>[
        // --- Daily Activities (النشاط اليومي) ---
        Wird(id: 'd_1', text: 'صلاة الفجر في المسجد جماعة', type: WirdType.action, session: WirdSession.fajr, targetCount: 1, priority: WirdPriority.obligatory, frequency: WirdFrequency.daily),
        Wird(id: 'd_2', text: 'صلاة الظهر في المسجد جماعة', type: WirdType.action, session: WirdSession.duhr, targetCount: 1, priority: WirdPriority.obligatory, frequency: WirdFrequency.daily),
        Wird(id: 'd_3', text: 'صلاة العصر في المسجد جماعة', type: WirdType.action, session: WirdSession.duhr, targetCount: 1, priority: WirdPriority.obligatory, frequency: WirdFrequency.daily),
        Wird(id: 'd_4', text: 'صلاة المغرب في المسجد جماعة', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.obligatory, frequency: WirdFrequency.daily),
        Wird(id: 'd_5', text: 'صلاة العشاء في المسجد جماعة', type: WirdType.action, session: WirdSession.isha, targetCount: 1, priority: WirdPriority.obligatory, frequency: WirdFrequency.daily),
        Wird(id: 'd_6', text: 'قراءة أذكار الصباح', type: WirdType.dhikr, session: WirdSession.morning, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.daily),
        Wird(id: 'd_7', text: 'قراءة أذكار المساء', type: WirdType.dhikr, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.daily),
        Wird(id: 'd_8', text: 'الورد القرآني اليومي', type: WirdType.recitation, session: WirdSession.morning, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.daily),
        Wird(id: 'd_9', text: 'الأذكار عقب الصلوات', type: WirdType.dhikr, session: WirdSession.fajr, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.daily),
        Wird(id: 'd_10', text: 'صلاة الوتر', type: WirdType.action, session: WirdSession.sleep, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.daily),
        Wird(id: 'd_11', text: 'صلاة الضحى', type: WirdType.action, session: WirdSession.dhuha, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.daily),
        Wird(id: 'd_12', text: 'السنن الراتبة', type: WirdType.action, session: WirdSession.fajr, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.daily),
        Wird(id: 'd_13', text: 'الدوام الوظيفي/الدراسي', type: WirdType.action, session: WirdSession.morning, targetCount: 1, priority: WirdPriority.obligatory, frequency: WirdFrequency.daily),
        Wird(id: 'd_14', text: 'متابعة الأهل دينياً ودنيوياً', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.obligatory, frequency: WirdFrequency.daily),
        Wird(id: 'd_15', text: 'ورد المحاسبة اليومي', type: WirdType.action, session: WirdSession.sleep, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.daily),

        // --- Weekly Activities (النشاط الأسبوعي) ---
        Wird(id: 'w_1', text: 'التبكير لصلاة الجمعة', type: WirdType.action, session: WirdSession.duhr, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.weekly),
        Wird(id: 'w_2', text: 'قراءة سورة الكهف', type: WirdType.recitation, session: WirdSession.duhr, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.weekly),
        Wird(id: 'w_3', text: 'حضور درس', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_4', text: 'زيارة الأرحام أو التواصل بهم', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.weekly),
        Wird(id: 'w_5', text: 'المحافظة على سنن الفطرة', type: WirdType.action, session: WirdSession.morning, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.weekly),
        Wird(id: 'w_6', text: 'صيام الاثنين أو الخميس', type: WirdType.action, session: WirdSession.morning, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.weekly),
        Wird(id: 'w_7', text: 'المكث بعد الفجر حتى الشروق', type: WirdType.action, session: WirdSession.fajr, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_8', text: 'المكث بين المغرب والعشاء', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_9', text: 'إقامة درس للأهل', type: WirdType.action, session: WirdSession.isha, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_10', text: 'إخراج صدقة', type: WirdType.action, session: WirdSession.morning, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.weekly),
        Wird(id: 'w_11', text: 'إسداء نصيحة', type: WirdType.action, session: WirdSession.duhr, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_12', text: 'حضور الأهل درس أسبوعي', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_13', text: 'زيارة دعوية', type: WirdType.action, session: WirdSession.isha, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_14', text: 'قيام الليل', type: WirdType.action, session: WirdSession.sleep, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.weekly),
        Wird(id: 'w_15', text: 'متابعة موقع تربوي', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_16', text: 'مزاولة رياضة', type: WirdType.action, session: WirdSession.dhuha, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),
        Wird(id: 'w_17', text: 'ساعة تفكر أسبوعي', type: WirdType.action, session: WirdSession.dhuha, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.weekly),

        // --- Monthly Activities (النشاط الشهري) ---
        Wird(id: 'm_1', text: 'ختم القرآن الكريم', type: WirdType.recitation, session: WirdSession.morning, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.monthly),
        Wird(id: 'm_2', text: 'صيام أيام البيض', type: WirdType.action, session: WirdSession.morning, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.monthly),
        Wird(id: 'm_3', text: 'خروج ترويحي مع الأهل', type: WirdType.action, session: WirdSession.dhuha, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.monthly),
        Wird(id: 'm_4', text: 'عيادة مريض', type: WirdType.action, session: WirdSession.duhr, targetCount: 1, priority: WirdPriority.sunnah, frequency: WirdFrequency.monthly),
        Wird(id: 'm_5', text: 'زيارة أخوية / عالم', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.monthly),
        Wird(id: 'm_6', text: 'المشاركة في مناسبة (فرح - ترح)', type: WirdType.action, session: WirdSession.isha, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.monthly),
        Wird(id: 'm_7', text: 'الاشتراك في العمل الخيري', type: WirdType.action, session: WirdSession.maghrib, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.monthly),
        Wird(id: 'm_8', text: 'تعلم مهارة', type: WirdType.action, session: WirdSession.dhuha, targetCount: 1, priority: WirdPriority.nafl, frequency: WirdFrequency.monthly),
      ];
      _box.addAll(defaultWirds);
    }
    state = _box.values.toList();
  }
}

final completedWirdsProvider = StateNotifierProvider<CompletedWirdsNotifier, Set<String>>((ref) {
  return CompletedWirdsNotifier();
});

class CompletedWirdsNotifier extends StateNotifier<Set<String>> {
  CompletedWirdsNotifier() : super({});

  void complete(String wirdId) {
    state = {...state, wirdId};
  }
  
  void uncomplete(String wirdId) {
    state = {...state}..remove(wirdId);
  }
}

final trackingStateProvider = StateNotifierProvider<TrackingStateNotifier, Map<String, List<bool>>>((ref) {
  return TrackingStateNotifier();
});

class TrackingStateNotifier extends StateNotifier<Map<String, List<bool>>> {
  TrackingStateNotifier() : super({});

  void toggle(String wirdId, int index, int length) {
    var list = state[wirdId] ?? List.filled(length, false);
    list = List.from(list);
    list[index] = !list[index];
    state = {...state, wirdId: list};
  }
}

