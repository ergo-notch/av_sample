import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_events.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/update_loan_status_use_case.dart';

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  final UpdateLoanStatusUseCase updateLoanStatusUseCase;

  LoanBloc({required this.updateLoanStatusUseCase}) : super(LoanState()) {
    on<SetLoanPaymentStatusEvent>(_updateLoanStatus);
    on<SetLoanEvent>(_setLoan);
  }

  void _setLoan(SetLoanEvent event, emit) {
    emit(state.copyWith(loanEntity: event.loanEntity));
  }

  void _updateLoanStatus(
    SetLoanPaymentStatusEvent event,
    emit,
  ) async {
    final result = await updateLoanStatusUseCase(
      UpdateLoanStatusUseCaseParams(
        loanEntity: state.loanEntity ?? LoanEntity(),
        paid: event.paid,
      ),
    );
    result.fold(
      (failure) => throw Exception(),
      (success) => emit(state.copyWith(loanEntity: success)),
    );
  }
}
