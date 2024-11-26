import 'package:av_sample/features/home/domain/entities/loan_entity.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_bloc.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_events.dart';
import 'package:av_sample/features/home/presentation/item/bloc/loan_state.dart';
import 'package:av_sample/features/home/domain/use_cases/update_loan_status_use_case.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'loan_bloc_test.mocks.dart';

@GenerateMocks([UpdateLoanStatusUseCase])
void main() {
  late LoanBloc loanBloc;
  late MockUpdateLoanStatusUseCase mockUpdateLoanStatusUseCase;

  setUp(() {
    mockUpdateLoanStatusUseCase = MockUpdateLoanStatusUseCase();
    loanBloc = LoanBloc(updateLoanStatusUseCase: mockUpdateLoanStatusUseCase);
  });
  group('Test Loan Bloc', () {
    test('initial state should be LoanState', () {
      expect(loanBloc.state, isInstanceOf<LoanState>());
    });

    blocTest<LoanBloc, LoanState>(
      'emits [LoanState] with updated loanEntity when SetLoanEvent is added',
      build: () => loanBloc,
      wait: const Duration(milliseconds: 300),
      act: (bloc) => bloc.add(SetLoanEvent(loanEntity: LoanEntity(id: '1'))),
      expect: () => [
        isA<LoanState>()
            .having((p0) => p0.loanEntity, 'loanEntity', LoanEntity(id: '1'))
      ],
    );

    blocTest<LoanBloc, LoanState>(
      'emits [LoanState] with updated loanEntity when SetLoanPaymentStatusEvent is added',
      build: () {
        when(mockUpdateLoanStatusUseCase(any)).thenAnswer(
          (_) async => Right(LoanEntity(id: '1', isPaid: true)),
        );
        return loanBloc;
      },
      act: (bloc) {
        bloc.add(SetLoanPaymentStatusEvent(
            paid: true, loanEntity: LoanEntity(id: '1')));
      },
      expect: () => [
        isA<LoanState>().having((p0) => p0.loanEntity, 'loanEntity',
            LoanEntity(id: '1', isPaid: true))
      ],
    );
  });
}
