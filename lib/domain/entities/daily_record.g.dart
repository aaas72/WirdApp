// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyRecordAdapter extends TypeAdapter<DailyRecord> {
  @override
  final int typeId = 4;

  @override
  DailyRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyRecord(
      date: fields[0] as DateTime,
      completions: (fields[1] as Map).cast<String, int>(),
      skipped: (fields[2] as Map).cast<String, bool>(),
      isFullyCompleted: fields[3] as bool,
      streakDay: fields[4] as int,
      totalTimeInSeconds: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DailyRecord obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.completions)
      ..writeByte(2)
      ..write(obj.skipped)
      ..writeByte(3)
      ..write(obj.isFullyCompleted)
      ..writeByte(4)
      ..write(obj.streakDay)
      ..writeByte(5)
      ..write(obj.totalTimeInSeconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
