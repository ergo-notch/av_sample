import 'package:av_sample/features/home/data/models/loan_model.dart';
import 'package:equatable/equatable.dart';

enum LoanType {
  personal(0),
  auto(1),
  mortgage(2);

  final int value;

  const LoanType(this.value);

  factory LoanType.fromValue(int value) {
    switch (value) {
      case 0:
        return LoanType.personal;
      case 1:
        return LoanType.auto;
      case 2:
        return LoanType.mortgage;
      default:
        throw ArgumentError('Invalid loan type value');
    }
  }

  String get name {
    switch (this) {
      case LoanType.personal:
        return 'Personal';
      case LoanType.auto:
        return 'Autómovil';
      case LoanType.mortgage:
        return 'Hipotecario';
      default:
        return '';
    }
  }
}

class LoanEntity extends Equatable {
  final String? id;
  final LoanType? loanType;
  final num? amount;
  final num? weeklyAmount;
  final DateTime? paymentDate;
  final bool isPaid;
  LoanEntity({
    this.id,
    this.loanType,
    this.amount,
    this.weeklyAmount,
    this.paymentDate,
    this.isPaid = false,
  });

  factory LoanEntity.fromModel(LoanModel model) {
    return LoanEntity(
      id: model.id,
      loanType: LoanType.fromValue(model.loanType ?? 0),
      amount: model.amount,
      weeklyAmount: model.weeklyAmount,
      paymentDate: DateTime.parse(model.paymentDate ?? ''),
      isPaid: model.isPaid ?? false,
    );
  }

  LoanEntity copyWith({
    String? id,
    LoanType? loanType,
    num? amount,
    num? weeklyAmount,
    DateTime? paymentDate,
    bool? isPaid,
  }) {
    return LoanEntity(
      id: id ?? this.id,
      loanType: loanType ?? this.loanType,
      amount: amount ?? this.amount,
      weeklyAmount: weeklyAmount ?? this.weeklyAmount,
      paymentDate: paymentDate ?? this.paymentDate,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  @override
  List<Object?> get props =>
      [id, loanType, amount, weeklyAmount, paymentDate, isPaid];
}
