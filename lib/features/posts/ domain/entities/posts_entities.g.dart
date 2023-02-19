// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostsEntitiesAdapter extends TypeAdapter<PostsEntities> {
  @override
  final int typeId = 0;

  @override
  PostsEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostsEntities(
      text: fields[0] as String?,
      placeDateTime: fields[1] as String?,
      userId: fields[2] as String?,
      id: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PostsEntities obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.placeDateTime)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostsEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
