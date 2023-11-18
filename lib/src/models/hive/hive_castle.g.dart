// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_castle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCastleAdapter extends TypeAdapter<HiveCastle> {
  @override
  final int typeId = 1;

  @override
  HiveCastle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCastle(
      tiles: (fields[0] as List)?.cast<TileId>(),
      tileWidth: fields[1] as int,
      imagePath: fields[2] as String,
      created: fields[3] as DateTime,
      updated: fields[4] as DateTime,
      title: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCastle obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.tiles)
      ..writeByte(1)
      ..write(obj.tileWidth)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.created)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCastleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
