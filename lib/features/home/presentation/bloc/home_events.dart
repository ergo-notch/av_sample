import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchLoansEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class LoadedLoansEvent extends HomeEvent {
  final List<LoanEntity> loans;

  const LoadedLoansEvent({required this.loans});

  @override
  List<Object> get props => [loans];
}

class ErrorEvent extends HomeEvent {
  final String? error;

  const ErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];
}
