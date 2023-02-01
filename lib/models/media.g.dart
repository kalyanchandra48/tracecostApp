// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaAdapter extends TypeAdapter<Media> {
  @override
  final int typeId = 1;

  @override
  Media read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Media(
      mediaId: fields[1] as String,
      createdAt: fields[2] as String,
      mediaTitle: fields[3] as String,
      mid: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Media obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.mediaId)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.mediaTitle)
      ..writeByte(4)
      ..write(obj.mid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
