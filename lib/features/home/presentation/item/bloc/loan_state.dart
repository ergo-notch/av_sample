import 'package:av_sample/features/home/domain/entities/loan_entity.dart';

class LoanState {
  final LoanEntity? loanEntity;
  final String? error;

  LoanState({this.loanEntity, this.error});

  LoanState copyWith({LoanEntity? loanEntity, String? error}) {
    return LoanState(
      loanEntity: loanEntity ?? this.loanEntity,
      error: error ?? this.error,
    );
  }
}
