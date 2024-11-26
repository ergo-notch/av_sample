import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LoanEvent extends Equatable {
  const LoanEvent();
}

class SetLoanPaymentStatusEvent extends LoanEvent {
  final bool? paid;
  final LoanEntity? loanEntity;

  const SetLoanPaymentStatusEvent(
      {required this.paid, required this.loanEntity});

  @override
  List<Object?> get props => [paid, loanEntity];
}

class SetLoanEvent extends LoanEvent {
  final LoanEntity? loanEntity;

  const SetLoanEvent({required this.loanEntity});

  @override
  List<Object?> get props => [loanEntity];
}
