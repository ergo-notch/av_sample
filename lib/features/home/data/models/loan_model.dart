import 'package:equatable/equatable.dart';

class LoanModel extends Equatable {
  final String? id;
  final int? loanType;
  final num? amount;
  final num? weeklyAmount;
  final String? paymentDate;
  final bool? isPaid;

  LoanModel({
    this.id,
    this.loanType,
    this.amount,
    this.weeklyAmount,
    this.paymentDate,
    this.isPaid,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
      id: json['id'],
      loanType: json['loanType'],
      amount: json['loanAmount'],
      weeklyAmount: json['weeklyAmount'],
      paymentDate: json['paymentDay'],
      isPaid: json['paid'],
    );
  }

  @override
  List<Object?> get props => [];
}
