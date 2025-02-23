import 'package:json_annotation/json_annotation.dart';

part 'clan_transaction_entity.g.dart';

enum TransactionType {
  income,
  expense,
}

extension TransactionTypeExt on TransactionType {
  String title() {
    switch (this) {
      case TransactionType.income:
        return "Coming";
      case TransactionType.expense:
        return "Expense";
    }
  }
}

@JsonSerializable()
class ClanTransactionEntity {
  final String id;

  @JsonKey(name: 'clan_id')
  final String clanId;

  final double amount;

  @JsonKey(name: 'transaction_type')
  final TransactionType transactionType;

  final String? description;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  ClanTransactionEntity({
    required this.id,
    required this.clanId,
    required this.amount,
    required this.transactionType,
    this.description,
    required this.createdAt,
  });

  factory ClanTransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$ClanTransactionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ClanTransactionEntityToJson(this);
}
