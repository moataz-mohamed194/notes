// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntitiesAdapter extends TypeAdapter<UserEntities> {
  @override
  final int typeId = 1;

  @override
  UserEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntities(
      username: fields[0] as String?,
      password: fields[1] as String?,
      email: fields[2] as String?,
      imageAsBase64: fields[3] as String?,
      intrestId: fields[4] as String?,
      id: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntities obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.imageAsBase64)
      ..writeByte(4)
      ..write(obj.intrestId)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
