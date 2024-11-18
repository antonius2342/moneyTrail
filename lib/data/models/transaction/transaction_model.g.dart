// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 0;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      amount: fields[0] as double,
      note: fields[1] as String,
      date: fields[2] as DateTime,
      menu: fields[3] as String,
      category: fields[4] as String,
      annualOption: fields[5] as bool,
      pushNotification: fields[6] as bool,
      appreciation: fields[7] as bool,
      percentage: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.menu)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.annualOption)
      ..writeByte(6)
      ..write(obj.pushNotification)
      ..writeByte(7)
      ..write(obj.appreciation)
      ..writeByte(8)
      ..write(obj.percentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
