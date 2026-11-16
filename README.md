# Wird — Daily Worship Tracker

A minimalist, offline-first Flutter app for building a consistent daily routine of adhkar, duas and Quran recitation. Activities are organized around the five prayer times, tracked day by day, and summarized in clear statistics.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart_3-0175C2?style=flat-square&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-00B4D8?style=flat-square)
![Hive](https://img.shields.io/badge/Hive-FFB300?style=flat-square)
![Android](https://img.shields.io/badge/Android-3DDC84?style=flat-square&logo=android&logoColor=white)

## Features

- **Structured routine** — each activity (wird) has a type (dhikr, dua, recitation, tasbih, action), a session (Fajr, morning, Duha, Dhuhr, Maghrib, Isha, before sleep), a priority (obligatory, sunnah, nafl) and a frequency (daily, weekly, monthly)
- **Focus board and today view** — see what is due now and mark activities complete in one tap
- **Flow mode** — a distraction-free screen for working through activities one after another
- **Tracker** — daily, weekly and monthly progress tables
- **Statistics** — completion charts and reports
- **Offline-first** — all data is stored locally with Hive; no account or network connection required
- **Arabic-first UI** — full RTL layout with a soft glassmorphism theme

## Architecture

The app follows a layered structure with Riverpod for state management:

```text
lib/
├── core/theme/            # Colors, theme and glass container widget
├── domain/entities/       # Wird and DailyRecord models (Hive type adapters)
├── presentation/
│   ├── providers/         # Riverpod state (completion, toggling, persistence)
│   └── screens/           # home · today · flow · tracker · stats · settings
└── main.dart              # Hive init, adapters, localization, ProviderScope
```

## Tech Stack

| Concern | Choice |
|---|---|
| UI | Flutter, Google Fonts |
| State | flutter_riverpod |
| Storage | Hive, shared_preferences |
| Navigation | go_router |
| Charts | fl_chart |

## Getting Started

**Requirements:** Flutter SDK (Dart 3.11+), Android Studio or a connected device

```bash
flutter pub get
flutter run
```

Regenerate Hive adapters after changing the entities:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Roadmap

- [ ] Smart reminders with local notifications
- [ ] Dark mode
- [ ] Custom activity editor
- [ ] Backup and restore
- [ ] Calendar history view

## Author

**Abdellah Sheikh** — [abdellahsheikh.dev](https://abdellahsheikh.dev) · [LinkedIn](https://www.linkedin.com/in/abdellahsheikh)
