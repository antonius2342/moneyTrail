// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 0;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModel(
      id: fields[0] as String,
      amount: fields[1] as double,
      currency: fields[2] as String,
      type: fields[3] as TransactionType,
      category: fields[4] as String,
      accountDirection: fields[5] as String,
      date: fields[6] as DateTime,
      isAnnual: fields[7] as bool?,
      reminderDate: fields[8] as DateTime?,
      dueDate: fields[9] as DateTime?,
      isDepreciation: fields[10] as bool?,
      percentage: fields[11] as double?,
      notes: fields[12] as String?,
      attachments: (fields[13] as List?)?.cast<File>(),
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.accountDirection)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.isAnnual)
      ..writeByte(8)
      ..write(obj.reminderDate)
      ..writeByte(9)
      ..write(obj.dueDate)
      ..writeByte(10)
      ..write(obj.isDepreciation)
      ..writeByte(11)
      ..write(obj.percentage)
      ..writeByte(12)
      ..write(obj.notes)
      ..writeByte(13)
      ..write(obj.attachments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionTypeAdapter extends TypeAdapter<TransactionType> {
  @override
  final int typeId = 1;

  @override
  TransactionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionType.income;
      case 1:
        return TransactionType.expense;
      case 2:
        return TransactionType.liability;
      case 3:
        return TransactionType.asset;
      case 4:
        return TransactionType.accountReceivable;
      case 5:
        return TransactionType.equity;
      default:
        return TransactionType.income;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionType obj) {
    switch (obj) {
      case TransactionType.income:
        writer.writeByte(0);
        break;
      case TransactionType.expense:
        writer.writeByte(1);
        break;
      case TransactionType.liability:
        writer.writeByte(2);
        break;
      case TransactionType.asset:
        writer.writeByte(3);
        break;
      case TransactionType.accountReceivable:
        writer.writeByte(4);
        break;
      case TransactionType.equity:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
