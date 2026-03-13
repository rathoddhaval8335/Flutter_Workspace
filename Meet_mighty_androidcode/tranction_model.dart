class Transaction {
  final int id;
  final int userId;
  final String title;
  final double amount;
  final String date;
  final String type;
  final String? createdAt;

  Transaction({
    required this.id,
    required this.userId,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      amount: double.parse(json['amount'].toString()),
      date: json['date'],
      type: json['type'],
      createdAt: json['created_at'],
    );
  }
}

class TransactionSummary {
  final double totalIncome;
  final double totalExpense;
  final double balance;

  TransactionSummary({
    required this.totalIncome,
    required this.totalExpense,
    required this.balance,
  });

  factory TransactionSummary.fromJson(Map<String, dynamic> json) {
    return TransactionSummary(
      totalIncome: double.parse(json['income'].toString()),
      totalExpense: double.parse(json['expense'].toString()),
      balance: double.parse(json['balance'].toString()),
    );
  }
}