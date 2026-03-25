// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wird.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WirdAdapter extends TypeAdapter<Wird> {
  @override
  final int typeId = 3;

  @override
  Wird read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wird(
      id: fields[0] as String,
      text: fields[1] as String,
      transliteration: fields[2] as String?,
      meaning: fields[3] as String?,
      source: fields[4] as String?,
      type: fields[5] as WirdType,
      session: fields[6] as WirdSession,
      targetCount: fields[7] as int,
      priority: fields[8] as WirdPriority,
      isCustom: fields[9] as bool,
      sortOrder: fields[10] as int,
      frequency: fields[11] as WirdFrequency,
    );
  }

  @override
  void write(BinaryWriter writer, Wird obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.transliteration)
      ..writeByte(3)
      ..write(obj.meaning)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.session)
      ..writeByte(7)
      ..write(obj.targetCount)
      ..writeByte(8)
      ..write(obj.priority)
      ..writeByte(9)
      ..write(obj.isCustom)
      ..writeByte(10)
      ..write(obj.sortOrder)
      ..writeByte(11)
      ..write(obj.frequency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WirdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WirdTypeAdapter extends TypeAdapter<WirdType> {
  @override
  final int typeId = 0;

  @override
  WirdType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WirdType.dhikr;
      case 1:
        return WirdType.dua;
      case 2:
        return WirdType.recitation;
      case 3:
        return WirdType.tasbih;
      case 4:
        return WirdType.action;
      default:
        return WirdType.dhikr;
    }
  }

  @override
  void write(BinaryWriter writer, WirdType obj) {
    switch (obj) {
      case WirdType.dhikr:
        writer.writeByte(0);
        break;
      case WirdType.dua:
        writer.writeByte(1);
        break;
      case WirdType.recitation:
        writer.writeByte(2);
        break;
      case WirdType.tasbih:
        writer.writeByte(3);
        break;
      case WirdType.action:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WirdTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WirdSessionAdapter extends TypeAdapter<WirdSession> {
  @override
  final int typeId = 1;

  @override
  WirdSession read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WirdSession.fajr;
      case 1:
        return WirdSession.morning;
      case 2:
        return WirdSession.dhuha;
      case 3:
        return WirdSession.duhr;
      case 4:
        return WirdSession.maghrib;
      case 5:
        return WirdSession.isha;
      case 6:
        return WirdSession.sleep;
      default:
        return WirdSession.fajr;
    }
  }

  @override
  void write(BinaryWriter writer, WirdSession obj) {
    switch (obj) {
      case WirdSession.fajr:
        writer.writeByte(0);
        break;
      case WirdSession.morning:
        writer.writeByte(1);
        break;
      case WirdSession.dhuha:
        writer.writeByte(2);
        break;
      case WirdSession.duhr:
        writer.writeByte(3);
        break;
      case WirdSession.maghrib:
        writer.writeByte(4);
        break;
      case WirdSession.isha:
        writer.writeByte(5);
        break;
      case WirdSession.sleep:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WirdSessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WirdPriorityAdapter extends TypeAdapter<WirdPriority> {
  @override
  final int typeId = 2;

  @override
  WirdPriority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WirdPriority.obligatory;
      case 1:
        return WirdPriority.sunnah;
      case 2:
        return WirdPriority.nafl;
      default:
        return WirdPriority.obligatory;
    }
  }

  @override
  void write(BinaryWriter writer, WirdPriority obj) {
    switch (obj) {
      case WirdPriority.obligatory:
        writer.writeByte(0);
        break;
      case WirdPriority.sunnah:
        writer.writeByte(1);
        break;
      case WirdPriority.nafl:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WirdPriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WirdFrequencyAdapter extends TypeAdapter<WirdFrequency> {
  @override
  final int typeId = 5;

  @override
  WirdFrequency read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WirdFrequency.daily;
      case 1:
        return WirdFrequency.weekly;
      case 2:
        return WirdFrequency.monthly;
      default:
        return WirdFrequency.daily;
    }
  }

  @override
  void write(BinaryWriter writer, WirdFrequency obj) {
    switch (obj) {
      case WirdFrequency.daily:
        writer.writeByte(0);
        break;
      case WirdFrequency.weekly:
        writer.writeByte(1);
        break;
      case WirdFrequency.monthly:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WirdFrequencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
