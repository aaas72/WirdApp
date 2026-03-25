import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'domain/entities/wird.dart';
import 'domain/entities/daily_record.dart';
import 'presentation/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  Hive.registerAdapter(WirdTypeAdapter());
  Hive.registerAdapter(WirdSessionAdapter());
  Hive.registerAdapter(WirdPriorityAdapter());
  Hive.registerAdapter(WirdFrequencyAdapter());
  Hive.registerAdapter(WirdAdapter());
  Hive.registerAdapter(DailyRecordAdapter());
  
  await Hive.openBox<Wird>('wirds_v2');
  await Hive.openBox<DailyRecord>('daily_records');

  runApp(const ProviderScope(child: WirdApp()));
}

class WirdApp extends StatelessWidget {
  const WirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'وِرد',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'),
      ],
      locale: const Locale('ar', 'SA'),
      home: const MainScreen(),
    );
  }
}
