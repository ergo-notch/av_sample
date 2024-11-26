import 'package:av_sample/features/home/domain/entities/loan_entity.dart';

enum HomeStatus { initial, fetching, success, error }

class HomeState {
  final HomeStatus status;
  final List<LoanEntity> loans;
  final String? errorMessage;

  HomeState(
      {this.status = HomeStatus.initial,
      this.loans = const [],
      this.errorMessage});

  HomeState copyWith(
      {HomeStatus? status, List<LoanEntity>? loans, String? errorMessage}) {
    return HomeState(
      status: status ?? this.status,
      loans: loans ?? this.loans,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
